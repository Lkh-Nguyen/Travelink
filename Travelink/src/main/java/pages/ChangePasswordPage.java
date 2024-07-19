package pages;

import java.time.Duration;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class ChangePasswordPage {

    private WebDriver driver;

    // Locators
    public By oldPasswordBox = By.name("password");
    private By newPasswordBox = By.name("newpassword");
    private By reEnterPasswordBox = By.name("re_newpassword");
    private By saveButton = By.id("saveButton");
    private By cancelButton = By.id("cancelButton");
    public By statusMessage = By.cssSelector("div[id='status-message'] div div p");

    // Constructor
    public ChangePasswordPage(WebDriver driver) {
        this.driver = driver;
    }

    // Page actions
    public void enterPassword(String oldPasswordString, String newPasswordString, String reEnterPasswordString) {
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofMinutes(1)); // Wait up to 10 seconds
        wait.until(ExpectedConditions.visibilityOfElementLocated(oldPasswordBox)).sendKeys(oldPasswordString);
        wait.until(ExpectedConditions.visibilityOfElementLocated(newPasswordBox)).sendKeys(newPasswordString);
        wait.until(ExpectedConditions.visibilityOfElementLocated(reEnterPasswordBox)).sendKeys(reEnterPasswordString);
    }

    public void clickSaveButton() {
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofMinutes(1)); // Wait up to 10 seconds
        WebElement saveButtonElement = wait.until(ExpectedConditions.elementToBeClickable(saveButton));
        saveButtonElement.click();
    }

    public void clickCancelButton() {
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofMinutes(1)); // Wait up to 10 seconds
        WebElement cancelButtonElement = wait.until(ExpectedConditions.elementToBeClickable(cancelButton));
        cancelButtonElement.click();
    }
}
