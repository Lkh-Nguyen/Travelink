/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pages;


import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
import io.github.bonigarcia.wdm.WebDriverManager;
import java.time.Duration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvFileSource;
import org.openqa.selenium.By;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import static org.junit.jupiter.api.Assertions.assertTrue;

/**
 *
 * @author admin
 */
public class AddNewRoomPage {

    private WebDriver driver;
    private Map<String, Object> vars;
    JavascriptExecutor js;

    public Selenium_TestTest() {
    }

    @BeforeAll
    public static void setUpClass() {

    }

    @AfterAll
    public static void tearDownClass() {
    }

    @BeforeEach
    public void setUp() {
        // Set up ChromeDriver using WebDriverManager
        WebDriverManager.chromedriver().setup();
        driver = new ChromeDriver();
        js = (JavascriptExecutor) driver;
        vars = new HashMap<String, Object>();
    }

    @AfterEach
    public void tearDown() {
        // Close the browser
        if (driver != null) {
            driver.quit();
        }
    }

    /**
     * Test of main method, of class Selenium_Test.
     */
    @Test
    public void testGoogleSearch() {
        // Open Google
        driver.get("https://www.google.com");

        // Verify the title
        String title = driver.getTitle();
        assertEquals("Google", title);
    }

    @Test
    public void testSearch() {
        // Open Google
        driver.get("https://www.google.com");

        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));

        // Wait for the search box to be present
        WebElement searchText = wait.until(ExpectedConditions.presenceOfElementLocated(By.name("q")));

        searchText.sendKeys("dai hoc fpt da nang");

        // Wait for the search button to be clickable and then click it
        WebElement googleSearchButton = wait.until(ExpectedConditions.elementToBeClickable(By.name("btnK")));
        googleSearchButton.click();

        // Wait for the search results page to load
        wait.until(ExpectedConditions.titleContains("fpt da nang"));

        // Assert that the title contains the search term
        String title = driver.getTitle();
        assertTrue(title.contains("fpt da nang"));
    }

    @Test
    public void testLogin() {
        // Mở trang login của OrangeHRM
        driver.get("https://opensource-demo.orangehrmlive.com/web/index.php/auth/login");

        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));

        WebElement usernameField = wait.until(ExpectedConditions.presenceOfElementLocated(By.name("username")));
        usernameField.sendKeys("Admin");

        WebElement passwordField = wait.until(ExpectedConditions.presenceOfElementLocated(By.name("password")));
        passwordField.sendKeys("admin123");

        WebElement loginButton = wait.until(ExpectedConditions.elementToBeClickable(By.tagName("button")));
        loginButton.click();

        wait.until(ExpectedConditions.titleContains("OrangeHRM"));

        String title = driver.getTitle();
        assertTrue(title.contains("OrangeHRM"));

        try {
            Thread.sleep(10000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testLoginFailure() {
        // Open the login page of OrangeHRM
        driver.get("https://opensource-demo.orangehrmlive.com/web/index.php/auth/login");

        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));

        // Enter invalid username
        WebElement usernameField = wait.until(ExpectedConditions.presenceOfElementLocated(By.name("username")));
        usernameField.sendKeys("InvalidUser");

        // Enter invalid password
        WebElement passwordField = wait.until(ExpectedConditions.presenceOfElementLocated(By.name("password")));
        passwordField.sendKeys("InvalidPassword");

        // Click the login button
        WebElement loginButton = wait.until(ExpectedConditions.elementToBeClickable(By.tagName("button")));
        loginButton.click();

        // Wait for the error message to be visible
        WebElement errorMessage = wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".oxd-text--p.oxd-text--error"))); // Update this selector based on the actual error message element

        // Assert that the error message contains the expected text
        String errorText = errorMessage.getText();
        assertTrue(errorText.contains("Invalid credentials")); // Update this based on the actual error message

        // Optionally, sleep for a while to see the result (not recommended for actual tests)
        try {
            Thread.sleep(10000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    private void assertLowerThanZero(String fieldName, String value) {
        int intValue = Integer.parseInt(value);
        assertEquals(true, intValue > 0, fieldName + " should be greater than or equal to zero, but was " + value);
    }

    @ParameterizedTest
    @CsvFileSource(resources = "/data-room.csv")
    @DisplayName("Test Add Room with multiple credentials")
    public void add(String name, String capacity, String description, String totalRoom, String price) throws InterruptedException {
        driver.get("http://localhost:8080/Travelink/HotelHost_Login.jsp");
        driver.manage().window().setSize(new Dimension(974, 1032));

        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(20)); // Thời gian chờ

        // Đăng nhập
        //Yêu cầu selenium chờ đến khi có phần tử => phần tử hiện thị và có thể tương tác
        WebElement emailField = wait.until(ExpectedConditions.elementToBeClickable(By.id("form2Example17")));
        emailField.sendKeys("example6@email.com");

        WebElement passwordField = wait.until(ExpectedConditions.elementToBeClickable(By.id("form2Example27")));
        passwordField.sendKeys("123");

        WebElement loginButton = wait.until(ExpectedConditions.elementToBeClickable(By.cssSelector(".btn")));
        loginButton.click();

        // Chờ cho nút cụ thể xuất hiện và nhấp vào
        WebElement specificButton = wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".col-md-3:nth-child(5) > #cardBelow .btn")));
        //Ép kiểu driver về JavaScriptExecutor và tự cuộn input xuống vùng nhìn thấy cuẩ trình duyệt
        ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView(true);", specificButton);
        specificButton.click();

        // Chờ cho phần tử select xuất hiện và nhấp vào
        WebElement hotelSelect123 = wait.until(ExpectedConditions.elementToBeClickable(By.id("hotelSelect")));
        ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView(true);", hotelSelect123);
        hotelSelect123.click();
        Thread.sleep(2000);

        // Chờ cho tất cả các tùy chọn trong phần tử select được tải đầy đủ
        wait.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//select[@id='hotelSelect']/option")));

        Select select = new Select(hotelSelect123);
        select.selectByVisibleText("Davue Hotel Da Nang"); //SelectByVisibleText dùng để tùy chọn trong select

        WebElement nameField = wait.until(ExpectedConditions.elementToBeClickable(By.id("name")));
        ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView(true);", nameField);
        nameField.sendKeys(name);
        Thread.sleep(2000);

        WebElement capacityField = wait.until(ExpectedConditions.elementToBeClickable(By.id("newRoomCapacity")));
        ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView(true);", capacityField);
        capacityField.sendKeys(capacity);
        Thread.sleep(2000);

        WebElement descriptionField = wait.until(ExpectedConditions.elementToBeClickable(By.id("newRoomDescription")));
        ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView(true);", descriptionField);
        descriptionField.sendKeys(description);
        Thread.sleep(2000);

        WebElement totalsRoomFields = wait.until(ExpectedConditions.elementToBeClickable(By.id("newRoomTotalRooms")));
        ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView(true);", totalsRoomFields);
        totalsRoomFields.sendKeys(totalRoom);
        Thread.sleep(2000);

        WebElement pricesField = wait.until(ExpectedConditions.elementToBeClickable(By.id("newRoomPrice")));
        ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView(true);", pricesField);
        pricesField.sendKeys(price);
        Thread.sleep(2000);

        WebElement saveButton = wait.until(ExpectedConditions.elementToBeClickable(By.cssSelector(".btn-primary")));
        ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView(true);", saveButton);
        ((JavascriptExecutor) driver).executeScript("arguments[0].click();", saveButton);
        Thread.sleep(2000);

        WebElement confirmButton = wait.until(ExpectedConditions.elementToBeClickable(By.cssSelector(".swal2-confirm")));
        ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView(true);", confirmButton);
        confirmButton.click();
        

        WebElement successMessage = wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".swal2-html-container")));
        String messageText = successMessage.getText();
        assertEquals("Add Room Failed", messageText, "Success message did not match");

        //Add Room Failed
        
        // Kiểm tra các giá trị
        if (Integer.parseInt(capacity) < 0) {
            assertLowerThanZero("Capacity", capacity);
        }
        // Kiểm tra giá trị totalRoom
        if (Integer.parseInt(totalRoom) < 0) {
            assertLowerThanZero("Total Rooms", totalRoom);
        }
        // Kiểm tra giá trị price
        if (Integer.parseInt(price) < 0) {
            assertLowerThanZero("Price", price);
        }
    }

}
