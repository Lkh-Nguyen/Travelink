package tests;

import io.github.bonigarcia.wdm.WebDriverManager;
import java.time.Duration;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvFileSource;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import pages.ChangePasswordPage;
import pages.CustomerLoginPage;

/**
 *
 * @author ASUS
 */
public class ChangePasswordTest {

    private CustomerLoginPage customerLoginPage;
    private WebDriver driver;
    private ChangePasswordPage changePasswordPage;

    public ChangePasswordTest() {
    }

    @BeforeEach
    public void setUp() {
        WebDriverManager.chromedriver().setup();
        driver = new ChromeDriver();
        driver.manage().window().maximize();

        driver.get("http://localhost:8080/Travelink/Form_Login.jsp"); // Adjust the URL to your local setup

        customerLoginPage = new CustomerLoginPage(driver);
        customerLoginPage.clickLoginButton();
        customerLoginPage.enterEmail("cus1@email.com");
        customerLoginPage.enterPassword("22222222");
        customerLoginPage.clickSignInButton();

        driver.get("http://localhost:8080/Travelink/My_Account_Change.jsp"); // Adjust the URL to your local setup
        changePasswordPage = new ChangePasswordPage(driver);
    }

    @AfterEach
    public void tearDown() {
        if (driver != null) {
            driver.quit();
        }
    }

    @ParameterizedTest
    @CsvFileSource(resources = "/changePassword.csv")
    public void testChangePassword(String oldPasswordString, String newPasswordString, String reEnterPasswordString, String expectedMessage) 
            throws Exception {
        if (expectedMessage.equals("None")) {
            changePasswordPage.enterPassword(oldPasswordString, newPasswordString, reEnterPasswordString);
            changePasswordPage.clickCancelButton();
            assertEquals("", driver.findElement(changePasswordPage.oldPasswordBox).getText());
            return;
        }
        changePasswordPage.enterPassword(oldPasswordString, newPasswordString, reEnterPasswordString);
        changePasswordPage.clickSaveButton();
        
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofMinutes(1));
        wait.until(ExpectedConditions.visibilityOfElementLocated(changePasswordPage.statusMessage));
        assertEquals(expectedMessage, driver.findElement(changePasswordPage.statusMessage).getText());
    }

}
