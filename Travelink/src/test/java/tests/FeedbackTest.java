/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tests;

import io.github.bonigarcia.wdm.WebDriverManager;
import java.time.Duration;
import org.junit.jupiter.api.AfterEach;
import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvFileSource;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import pages.FeedbackPage;
import pages.LoginPage;

/**
 *
 * @author DUYAN
 */
public class FeedbackTest {

    private WebDriver driver;
    private FeedbackPage feedbackPage;
    private LoginPage loginPage;

    @BeforeEach
    public void setUp() {
        WebDriverManager.chromedriver().setup();
        driver = new ChromeDriver();
        driver.get("http://localhost:8080/Travelink/Form_Login.jsp"); // Adjust the URL to your local setup

        loginPage = new LoginPage(driver);
        loginPage.clickCusLogin();
        loginPage.enterEmail1("example1@email.com");
        loginPage.enterPassword1("123");
        loginPage.clickSignInButton();

        driver.get("http://localhost:8080/Travelink/CreateFeedback.jsp?reservation_ID=173&hotel_ID=5"); // Adjust the URL to your local setup
        feedbackPage = new FeedbackPage(driver);
    }

    @ParameterizedTest
    @CsvFileSource(resources = "/test-create-feedback.csv", numLinesToSkip = 1)
    public void testCreateFeedback(int rating, String description) {
        feedbackPage.selectRating(rating);
        feedbackPage.enterDescription(description);
        feedbackPage.submitForm();

  
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
        if (description.length() <= 200) {
            wait.until(ExpectedConditions.titleIs("Booking History"));
            String title = driver.getTitle();
            assertEquals("Booking History", title);
        } else {
            wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("error-message")));
            String errorMessage = feedbackPage.getErrorMessage();
            assertEquals("Description cannot exceed 200 characters.", errorMessage);
        }
    }

    @AfterEach
    public void tearDown() {
        if (driver != null) {
            driver.quit();
        }
    }
}
