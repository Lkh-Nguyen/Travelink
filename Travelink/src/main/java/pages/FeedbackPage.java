/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pages;

/**
 *
 * @author DUYAN
 */
import java.time.Duration;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class FeedbackPage {

    private WebDriver driver;
    private WebDriverWait wait;

    // Locators
//    private By ratingStars = By.name("rating");
    private By ratingStars = By.xpath("//input[@type='radio']");

    private By descriptionField = By.name("description");
    private By submitButton = By.id("comfirmBtn");
    private By errorMessage = By.id("error-message");

    // Constructor
    public FeedbackPage(WebDriver driver) {
        this.driver = driver;
        wait = new WebDriverWait(driver, Duration.ofSeconds(5));
    }

    // Page actions
    public void selectRating(int stars) {
        WebElement ratingElement = driver.findElement(By.cssSelector("#star"+stars));
        ratingElement.click();
    }

    public void enterDescription(String description) {
        WebElement descriptionElement = driver.findElement(descriptionField);
        descriptionElement.clear();
        descriptionElement.sendKeys(description);
    }

    public void submitForm() {
        WebElement submitBtn = driver.findElement(submitButton);
        submitBtn.click();
    }

    public String getErrorMessage() {
        WebElement errorElement = driver.findElement(errorMessage);
        return errorElement.getText();
    }
}
