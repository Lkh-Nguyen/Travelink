package tests;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.edge.EdgeDriver;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.JavascriptExecutor;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import io.github.bonigarcia.wdm.WebDriverManager;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalDate;

import java.util.HashMap;
import java.util.Map;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvFileSource;
import org.junit.jupiter.params.provider.CsvFileSources;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class TestTest {

    private WebDriver driver;
    private Map<String, Object> vars;
    JavascriptExecutor js;

    @BeforeEach
    public void setUp() {
        // Use WebDriverManager to setup the EdgeDriver
        WebDriverManager.edgedriver().setup();

        driver = new EdgeDriver();
        js = (JavascriptExecutor) driver;
        vars = new HashMap<String, Object>();
    }

    @AfterEach
    public void tearDown() {
        driver.quit();
    }
@ParameterizedTest 
@CsvFileSource(resources = "/search.csv")
//  public void test(String location,int people,String beginDate,String endDate,int room) {
//     driver.get("http://localhost:8080/Travelink/search");
//    driver.manage().window().setSize(new Dimension(1936, 1048));
//    
//    driver.findElement(By.name("location")).click();
//    {
//        WebElement dropdown = driver.findElement(By.name("location"));
//        dropdown.findElement(By.xpath("//option[. = 'Đà Nẵng']")).click();
//    }
//    
//    driver.findElement(By.cssSelector(".form__group:nth-child(2)")).click();
//    driver.findElement(By.id("numberInput")).sendKeys("2");
//    driver.findElement(By.id("checkInDate")).sendKeys("07/19/2024");
//    driver.findElement(By.id("checkOutDate")).sendKeys("07/20/2024");
//    driver.findElement(By.name("number_of_rooms")).click();
//    driver.findElement(By.cssSelector(".form__group:nth-child(5)")).click();
//    
//    {
//        WebElement element = driver.findElement(By.cssSelector(".form__group:nth-child(5)"));
//        Actions builder = new Actions(driver);
//        builder.doubleClick(element).perform();
//    }
//    
//    driver.findElement(By.name("number_of_rooms")).sendKeys("2");
//    driver.findElement(By.cssSelector(".ri-search-line:nth-child(1)")).click();
//
//    // Adding WebDriverWait to wait for the specified element to be visible
//    WebDriverWait wait = new WebDriverWait(driver, Duration.ofMinutes(1)); // 10 seconds timeout
//    wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//div[@class='col-md-12 mt-5']//div[1]//div[1]//div[2]//div[1]//form[1]//button[1]")));
//
//    driver.findElement(By.cssSelector("body")).click();
//    driver.findElement(By.linkText("Home")).click();
//    
//    driver.quit();
//  }
    public void test(String location, int people, String beginDate, String endDate, int room,String espectedMessage) {
        java.sql.Date checkInDate = null;
        java.sql.Date checkOutDate = null;
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
            checkInDate = new java.sql.Date(dateFormat.parse(beginDate).getTime());
            checkOutDate = new java.sql.Date(dateFormat.parse(endDate).getTime());
        } catch (ParseException e) {
            e.printStackTrace(); // Xử lý ngoại lệ phân tích cú pháp một cách thích hợp
        }
        LocalDate currentDate = LocalDate.now();
        LocalDate checkInDateLocal = checkInDate.toLocalDate();
        if (currentDate.isAfter(checkInDateLocal)){
            String mss = driver.findElement(By.xpath("//div[@id='swal2-html-container']")).getText();
            Assertions.assertEquals(espectedMessage, mss);
        }
        else if (checkInDate.after(checkOutDate) || checkInDate.equals(checkOutDate)){
            String mss = driver.findElement(By.xpath("//div[@id='swal2-html-container']")).getText();
            Assertions.assertEquals(espectedMessage, mss);
        }else if (room > people) {
            
            String mss = driver.findElement(By.xpath("//p[normalize-space()='Room and People is disable']")).getText();
            Assertions.assertEquals(espectedMessage, mss);
        }
        
        driver.get("http://localhost:8080/Travelink/search");
        driver.manage().window().setSize(new Dimension(1936, 1048));

        driver.findElement(By.name("location")).click();
        {
            WebElement dropdown = driver.findElement(By.name("location"));
            dropdown.findElement(By.xpath("//option[. = '" + location + "']")).click();
        }

        driver.findElement(By.cssSelector(".form__group:nth-child(2)")).click();
        driver.findElement(By.id("numberInput")).sendKeys(String.valueOf(people));
        driver.findElement(By.id("checkInDate")).sendKeys(beginDate);
        driver.findElement(By.id("checkOutDate")).sendKeys(endDate);
        driver.findElement(By.name("number_of_rooms")).click();
        driver.findElement(By.cssSelector(".form__group:nth-child(5)")).click();

        {
            WebElement element = driver.findElement(By.cssSelector(".form__group:nth-child(5)"));
            Actions builder = new Actions(driver);
            builder.doubleClick(element).perform();
        }

        driver.findElement(By.name("number_of_rooms")).sendKeys(String.valueOf(room));
        driver.findElement(By.cssSelector(".ri-search-line:nth-child(1)")).click();

        // Adding WebDriverWait to wait for the specified element to be visible
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10)); // 10 seconds timeout
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//div[@class='col-md-12 mt-5']//div[1]//div[1]//div[2]//div[1]//form[1]//button[1]")));

        driver.findElement(By.cssSelector("body")).click();
        driver.findElement(By.linkText("Home")).click();        
        driver.quit();
    }
}
