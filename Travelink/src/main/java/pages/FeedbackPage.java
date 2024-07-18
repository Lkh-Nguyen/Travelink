/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pages;

/**
 *
 * @author DUYAN
 */
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

public class FeedbackPage {
    private WebDriver driver;

    // Locators
    private By ratingStars = By.name("rating");
    private By descriptionField = By.id("description");
    private By submitButton = By.id("comfirmBtn");
    private By errorMessage = By.id("error-message");

    // Constructor
    public FeedbackPage(WebDriver driver) {
        this.driver = driver;
    }

    // Page actions
    public void selectRating(int stars) {
        WebElement ratingElement = driver.findElement(By.id("star" + stars));
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

