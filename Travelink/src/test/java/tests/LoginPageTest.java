package tests;

import io.github.bonigarcia.wdm.WebDriverManager;
import java.time.Duration;
import java.util.regex.Pattern;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvFileSource;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import static org.junit.jupiter.api.Assertions.*;
import pages.LoginPage;

public class LoginPageTest {

    private WebDriver driver;
    private LoginPage loginPage;

    public static boolean isValidEmail(String email) {
        // Biểu thức chính quy để kiểm tra định dạng email
        String regex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";

        // Kiểm tra email có khớp với biểu thức chính quy không
        return Pattern.compile(regex).matcher(email).matches();
    }

    @BeforeEach
    public void setUp() {
        WebDriverManager.chromedriver().setup();
        driver = new ChromeDriver();
        driver.get("http://localhost:8080/Travelink/HotelHost_Login.jsp");
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
        loginPage = new LoginPage(driver);
    }

    @ParameterizedTest
    @CsvFileSource(resources = "/test-login.csv")
    @DisplayName("Test Login with multiple credentials")
    public void testLogin(String email, String password) {
        try {
            // Handle potential null values for email and password
            email = email != null ? email.trim() : "";
            password = password != null ? password.trim() : "";

            // Validate email format if needed (this could throw an exception)
            if (email != "") {
                if (!isValidEmail(email)) {
                    throw new IllegalArgumentException("Invalid email format");
                }
            }

            // Enter login information
            loginPage.enterEmail(email);
            loginPage.enterPassword(password);

            // Click login button
            loginPage.clickLoginButton();

            // Wait for the page to load after login
            WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));

            if (email.isEmpty() || password.isEmpty()) {
                // Check that the form is not submitted due to required attribute
                WebElement emailField = driver.findElement(By.name("email"));
                WebElement passwordField = driver.findElement(By.name("password"));

                assertTrue(emailField.getAttribute("validationMessage").contains("fill out this field") || passwordField.getAttribute("validationMessage").contains("fill out this field"), "Please include an '@' the email address");
            } else {
                try {
                    // Check URL for successful login
                    wait.until(ExpectedConditions.urlToBe("http://localhost:8080/Travelink/homeHotelHostServlet"));
                    String currentUrl = driver.getCurrentUrl();
                    assertEquals("http://localhost:8080/Travelink/homeHotelHostServlet", currentUrl, "The page URL should be 'http://localhost:8080/Travelink/homeHotelHostServlet'");
                } catch (Exception e) {
                    // Check for error message if login failed
                    WebElement errorAlert = wait.until(ExpectedConditions.presenceOfElementLocated(By.className("text-danger")));
                    String errorMessage = errorAlert.getText();
                    assertTrue(errorMessage.contains("does not")||errorMessage.contains("incorrect"));
                }
            }
        } catch (IllegalArgumentException e) {
            fail("Invalid email format: " + e.getMessage());
        }
    }

    @AfterEach
    public void tearDown() {
        if (driver != null) {
            driver.quit();
        }
    }
}
