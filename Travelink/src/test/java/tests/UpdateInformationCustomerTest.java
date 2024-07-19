/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tests;



import io.github.bonigarcia.wdm.WebDriverManager;
import java.time.Duration;
import java.util.List;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvFileSource;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class UpdateInformationCustomerTest {

    private WebDriver driver;

    @BeforeEach
    public void setUp() {
        // Set up ChromeDriver using WebDriverManager
        WebDriverManager.chromedriver().setup();
        driver = new ChromeDriver();
    }

    @ParameterizedTest
    @CsvFileSource(resources = "/test-login.csv")
    @DisplayName("Test Login with multiple credentials")
     public void testLogin3(String name, String DOB,String phone, String address, String gender, String CMND) {

        driver.get("http://localhost:9999/Travelink/Form_Login.jsp");

        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));

        // Wait for the search button to be clickable and then click it
        WebElement loginSearchButton = wait.until(ExpectedConditions.elementToBeClickable(By.id("showFormButton")));
        loginSearchButton.click();

        List<WebElement> emailFields = wait.until(ExpectedConditions.presenceOfAllElementsLocatedBy(By.name("email")));
        WebElement firstEmailField = emailFields.get(1);
        firstEmailField.sendKeys("cus1@email.com");

        List<WebElement> passwordFields = wait.until(ExpectedConditions.presenceOfAllElementsLocatedBy(By.name("password")));
        WebElement firstPasswordField = passwordFields.get(1);
        firstPasswordField.sendKeys("123");

        WebElement loginButton = wait.until(ExpectedConditions.elementToBeClickable(By.id("login")));
        loginButton.click();

        WebElement accountButton = wait.until(ExpectedConditions.elementToBeClickable(By.className("btns")));
        accountButton.click();

        //Delay 3s
        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        WebElement profileButton = wait.until(ExpectedConditions.elementToBeClickable(By.cssSelector("a[href='My_Account_Update.jsp']")));
        profileButton.click();

        //update information
        WebElement nameField = wait.until(ExpectedConditions.presenceOfElementLocated(By.name("name")));
        nameField.clear();
        nameField.sendKeys((name != null) ? name : "");

        WebElement dobField = wait.until(ExpectedConditions.presenceOfElementLocated(By.name("DOB")));
        dobField.clear();
        dobField.sendKeys((DOB != null) ? DOB : "");

        WebElement numberPhoneField = wait.until(ExpectedConditions.presenceOfElementLocated(By.name("phone")));
        numberPhoneField.clear();
        numberPhoneField.sendKeys((phone != null) ? phone : "");

        WebElement addressField = wait.until(ExpectedConditions.presenceOfElementLocated(By.name("address")));
        addressField.clear();
        addressField.sendKeys((address != null) ? address : "");

        // Interact with gender field
        List<WebElement> genderFields = wait.until(ExpectedConditions.presenceOfAllElementsLocatedBy(By.name("gender")));
        WebElement gender1Field = genderFields.get(0); // Assuming gender1Field is for "true"
        WebElement gender2Field = genderFields.get(1); // Assuming gender2Field is for "false"

        if ("true".equals(gender)) {
            if (!gender1Field.isSelected()) {
                gender1Field.click();
            }
            if (gender2Field.isSelected()) {
                gender2Field.click();
            }
        } else {
            if (!gender2Field.isSelected()) {
                gender2Field.click();
            }
            if (gender1Field.isSelected()) {
                gender1Field.click();
            }
        }

        WebElement cmndField = wait.until(ExpectedConditions.presenceOfElementLocated(By.name("CMND")));
        cmndField.clear();
        cmndField.sendKeys((CMND != null) ? CMND : "");
        
        
        //Delay 3s
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        
        WebElement saveUpdateButton = wait.until(ExpectedConditions.elementToBeClickable(By.id("saveButton")));
        saveUpdateButton.click();
        
//        WebElement successMessage = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("status-message")));
//        String messageText = successMessage.getText();
//        assertEquals("Update successfully Account", messageText, "Update successfully Account");

        
        //Delay 2s
        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
     
    @AfterEach
    public void tearDown() {
        // Close the browser
        if (driver != null) {
            driver.quit();
        }
    }
}
