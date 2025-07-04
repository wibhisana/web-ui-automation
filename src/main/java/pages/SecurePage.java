package pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.openqa.selenium.support.ui.ExpectedConditions;
import java.time.Duration;

public class SecurePage {
    private WebDriver driver;
    private WebDriverWait wait;

    @FindBy(id = "flash")
    private WebElement successMessage;

    @FindBy(css = "#flash")
    private WebElement flashMessage;

    public SecurePage(WebDriver driver) {
        this.driver = driver;
        this.wait = new WebDriverWait(driver, Duration.ofSeconds(10));
        PageFactory.initElements(driver, this);
    }

    public String getSuccessMessage() {
        try {
            wait.until(ExpectedConditions.visibilityOf(flashMessage));
            return flashMessage.getText();
        } catch (Exception e) {
            return "Success message not found";
        }
    }
}