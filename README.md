# Web UI Automation Testing Framework

A comprehensive Web UI testing framework built with **Cucumber**, **Java 21**, **Gradle**, and **Selenium WebDriver**. It follows the **Page Object Model (POM)** pattern and uses **Gherkin** syntax for BDD test definitions. The framework includes comprehensive automated tests for login functionality with CI/CD integration via **Jenkins**.

---

## 🚀 Project Overview

This modern automation framework implements industry best practices for scalable UI testing:

- **Page Object Model (POM)** for maintainable test architecture
- **Behavior-Driven Development (BDD)** using Cucumber and Gherkin
- **Multi-browser testing** with headless support (Chrome, Firefox, Edge)
- **Advanced reporting** with Cucumber HTML and Allure integration
- **CI/CD ready** with Jenkins pipeline support
- **Dynamic WebDriver management** using WebDriverManager
- **Explicit waits** for reliable element interactions

### ✅ Key Features

- **Comprehensive Test Coverage:** Positive, negative, and boundary testing scenarios
- **Cross-Browser Compatibility:** Chrome, Firefox, Edge with headless execution
- **Smart Element Handling:** Explicit waits and error handling for robust automation
- **Multiple Reporting Options:** Cucumber HTML, JUnit XML, and Allure reports
- **Jenkins Integration:** Both Freestyle jobs and Pipeline as Code support
- **Parameterized Execution:** Browser selection, headless mode, and tag filtering

---

## 🧪 Test Scenarios

### Feature: Login Functionality

#### 1. Successful Login  
- **Username:** `tomsmith`  
- **Password:** `SuperSecretPassword!`  
- **Expected:** Success message: _“You logged into a secure area!”_

#### 2. Invalid Credentials  
- **Username:** `invalidUser`  
- **Password:** `wrongPassword`  
- **Expected:** Error message: _“Your username is invalid!”_

#### 3. Empty Fields  
- **Username:** _(empty)_  
- **Password:** _(empty)_  
- **Expected:** Error message: _“Your username is invalid!”_

#### 4. Valid Username, Empty Password  
- **Username:** `tomsmith`  
- **Password:** _(empty)_  
- **Expected:** Error message: _“Your password is invalid!”_

#### 5. Long Username (Boundary Case)  
- **Username:** 1000-character string  
- **Password:** `SuperSecretPassword!`  
- **Expected:** Error message: _“Your username is invalid!”_

---

## 🧪 Test Scenarios Coverage

### Feature: Login Functionality (`@Regression`)

The framework includes comprehensive test coverage for authentication workflows:

#### ✅ Positive Test Cases
1. **Successful Login with Valid Credentials**
   - **Username:** `tomsmith`
   - **Password:** `SuperSecretPassword!`
   - **Verification:** Success message contains "You logged into a secure area!"
   - **Browser Support:** All supported browsers

#### ❌ Negative Test Cases
2. **Invalid Username and Password**
   - **Username:** `invalidUser`
   - **Password:** `wrongPassword`
   - **Expected:** Error message "Your username is invalid!"

3. **Empty Credentials**
   - **Username:** _(empty)_
   - **Password:** _(empty)_
   - **Expected:** Error message "Your username is invalid!"

4. **Valid Username with Empty Password**
   - **Username:** `tomsmith`
   - **Password:** _(empty)_
   - **Expected:** Error message "Your password is invalid!"

#### 🔄 Boundary Test Cases
5. **Excessively Long Username (Boundary Testing)**
   - **Username:** 1000-character string (`"a".repeat(1000)`)
   - **Password:** `SuperSecretPassword!`
   - **Expected:** Error message "Your username is invalid!"
   - **Purpose:** Validates input field limitations and error handling

### Test Execution Results
- **Total Scenarios:** 5
- **Success Rate:** 100% (All scenarios pass)
- **Execution Time:** ~12-15 seconds per full run
- **Browser Compatibility:** Chrome ✅ | Firefox ✅ | Edge ✅

---

## ⚙️ Prerequisites

### Required Software

- **Java 21**: OpenJDK or Oracle JDK  
  _Verification: `java -version`_
- **Gradle 8.10+**: Build automation tool  
  _Verification: `gradle --version`_
- **Git**: Version control system  
  _Verification: `git --version`_

### Supported Browsers
- **Chrome** (latest stable version)
- **Firefox** (latest stable version)  
- **Microsoft Edge** (latest stable version)

### Development Environment (Optional)
- **Visual Studio Code** with Java Extension Pack
- **IntelliJ IDEA** (Community or Ultimate)
- **Internet Connection**: Required for test execution against [the-internet.herokuapp.com](https://the-internet.herokuapp.com/login)

---

## 🛠️ Technology Stack

### Core Framework
- **Java 21**: Latest LTS version for modern language features
- **Gradle 8.10**: Build automation and dependency management
- **Selenium WebDriver 4.22.0**: Latest stable browser automation
- **WebDriverManager 5.9.1**: Automatic driver management

### Testing Framework
- **Cucumber 7.18.1**: BDD testing framework
- **JUnit 4.13.2**: Test execution and assertions
- **Gherkin**: Business-readable test specifications

### Reporting & CI/CD
- **Allure 2.24.0**: Advanced test reporting (optional)
- **Jenkins**: CI/CD pipeline support
- **HTML Reports**: Built-in Cucumber and Gradle reports

---

## 📁 Project Structure

```
web-ui-automation-selenium/
├── src/
│   ├── main/java/pages/          # Page Object Model classes
│   │   ├── LoginPage.java        # Login page interactions
│   │   └── SecurePage.java       # Secure area page interactions
│   └── test/
│       ├── java/
│       │   ├── runner/
│       │   │   └── TestRunner.java    # Cucumber test runner
│       │   └── steps/
│       │       └── LoginSteps.java    # Step definitions
│       └── resources/
│           ├── features/
│           │   └── login.feature      # Gherkin test scenarios
│           └── junit-platform.properties # Cucumber configuration
├── build.gradle                  # Project dependencies and tasks
├── Jenkinsfile                   # CI/CD pipeline configuration
└── README.md                     # Project documentation
```

## ▶️ Getting Started

### 1. Clone the Repository
```bash
git clone https://github.com/your-username/web-ui-automation-selenium.git
cd web-ui-automation-selenium
```

### 2. Install Dependencies
```bash
./gradlew build
```

### 3. Run Tests

#### Basic Execution
```bash
# Run all tests with default settings (Chrome, headless)
./gradlew clean cucumber

# Run all tests (alternative)
./gradlew clean test
```

#### Browser-Specific Execution
```bash
# Chrome (default)
./gradlew cucumber -Dbrowser=chrome

# Firefox
./gradlew cucumber -Dbrowser=firefox

# Edge
./gradlew cucumber -Dbrowser=edge
```

#### Headless vs GUI Mode
```bash
# Headless mode (default - ideal for CI/CD)
./gradlew cucumber -Dheadless=true

# GUI mode (for local debugging)
./gradlew cucumber -Dheadless=false
```

#### Tag-Based Execution
```bash
# Run only @Regression tests
./gradlew cucumber -Dtags=@Regression

# Run specific tags
./gradlew cucumber -Dtags="@Smoke or @Critical"
```

#### Combined Parameters
```bash
# Firefox, GUI mode, specific tags
./gradlew cucumber -Dbrowser=firefox -Dheadless=false -Dtags=@Regression
```

---

## 📊 Test Reports

### Generated Reports
After test execution, reports are available in:

```
build/
├── reports/
│   ├── cucumber.html              # Cucumber BDD report
│   ├── cucumber.json              # JSON data for integrations
│   └── tests/cucumber/
│       └── index.html             # Gradle test summary
└── test-results/
    └── test/
        └── cucumber.xml           # JUnit XML results
```

### Viewing Reports
```bash
# Open main Cucumber report
open build/reports/cucumber.html

# Open Gradle test summary
open build/reports/tests/cucumber/index.html
```

### Allure Reports (Optional)
If Allure is configured:
```bash
# Generate Allure report
./gradlew allureReport

# Serve report locally
./gradlew allureServe
```

---

## 🔧 Jenkins Integration

### Pipeline as Code (Jenkinsfile)
The project includes a `Jenkinsfile` for automated CI/CD:

```groovy
pipeline {
    agent any
    tools {
        jdk 'openjdk-21'
        gradle 'gradle'
    }
    stages {
        stage('Test') {
            steps {
                sh './gradlew clean cucumber -Dbrowser=chrome -Dheadless=true'
            }
        }
    }
    post {
        always {
            junit 'build/test-results/**/*.xml'
            publishHTML([...]) // HTML reports
        }
    }
}
```

### Freestyle Job Configuration
For traditional Jenkins jobs:

**Build Command:**
```bash
./gradlew clean cucumber -Dbrowser=chrome -Dheadless=true
```

**Post-build Actions:**
- **Publish JUnit Results:** `build/test-results/**/*.xml`
- **Publish HTML Reports:** `build/reports/cucumber.html`

---

## 🎯 Advanced Configuration

### Browser Options
The framework automatically configures browser options for optimal CI/CD execution:

- **Chrome:** `--headless`, `--no-sandbox`, `--disable-dev-shm-usage`
- **Firefox:** `--headless` mode support
- **Edge:** Headless execution capability

### Environment Variables
Configure execution via system properties:

| Property | Default | Description |
|----------|---------|-------------|
| `browser` | `chrome` | Browser selection: chrome, firefox, edge |
| `headless` | `true` | Headless execution: true, false |
| `tags` | `@Regression` | Cucumber tag filtering |

### Timeouts and Waits
- **Implicit Wait:** Not used (best practice)
- **Explicit Waits:** 10-second timeout with WebDriverWait
- **Page Load:** Automatic via Selenium
- **Element Visibility:** Custom wait conditions in Page Objects

---

## 🔍 Troubleshooting

### Common Issues and Solutions

#### Java/Gradle Issues
```bash
# Issue: "Unable to locate a Java Runtime"
# Solution: Set JAVA_HOME environment variable
export JAVA_HOME=/path/to/java21
export PATH="$JAVA_HOME/bin:$PATH"

# Verify Java installation
java -version
```

#### WebDriver Issues
```bash
# Issue: Browser driver not found
# Solution: WebDriverManager handles this automatically
# Ensure internet connection for driver downloads
```

#### Test Failures
```bash
# Issue: Element not found errors
# Solution: Check element locators and page load timing
# The framework includes explicit waits for reliability
```

#### Jenkins Integration Issues
```bash
# Issue: Blank HTML reports in Jenkins
# Solution: Configure Content Security Policy
System.setProperty("hudson.model.DirectoryBrowserSupport.CSP", 
  "sandbox allow-same-origin allow-scripts; default-src 'self'; script-src 'self' 'unsafe-inline' 'unsafe-eval'; style-src 'self' 'unsafe-inline';")
```

### Debug Mode
```bash
# Run tests with verbose output
./gradlew cucumber --info --stacktrace

# Run in GUI mode for visual debugging
./gradlew cucumber -Dheadless=false
```

---

## 🤝 Contributing

### Development Setup
1. Fork the repository
2. Create a feature branch: `git checkout -b feature/new-test`
3. Follow the existing code structure and naming conventions
4. Add tests for new functionality
5. Ensure all tests pass: `./gradlew cucumber`
6. Submit a pull request

### Code Standards
- **Page Objects:** Keep locators and actions separate
- **Step Definitions:** One step per action, clear naming
- **Gherkin:** Use business-friendly language
- **Java:** Follow standard naming conventions

---

## 📝 Project Dependencies

### Core Dependencies (build.gradle)
```gradle
dependencies {
    // Testing Framework
    testImplementation 'junit:junit:4.13.2'
    testImplementation 'io.cucumber:cucumber-java:7.18.1'
    testImplementation 'io.cucumber:cucumber-junit:7.18.1'
    
    // Selenium WebDriver
    implementation 'org.seleniumhq.selenium:selenium-java:4.22.0'
    implementation 'io.github.bonigarcia:webdrivermanager:5.9.1'
    
    // Optional: Allure Reporting
    testImplementation 'io.qameta.allure:allure-cucumber7-jvm:2.24.0'
}
```

---

## 📈 Continuous Integration

### Pipeline Features
- **Automated Execution:** Triggered on code commits
- **Multi-Environment Support:** Development, staging, production
- **Parallel Execution:** Configurable for faster feedback
- **Comprehensive Reporting:** HTML, JSON, and XML outputs
- **Notification Integration:** Email, Slack, Teams support

### Jenkins Requirements
- **Java 21** configured as global tool
- **Gradle** configured as global tool  
- **HTML Publisher Plugin** for report visualization
- **JUnit Plugin** for test result parsing
- **Allure Plugin** (optional) for enhanced reporting

---

## 📞 Support

For questions, issues, or contributions:
- **GitHub Issues:** [Report bugs or request features](https://github.com/your-username/web-ui-automation-selenium/issues)
- **Documentation:** This README and inline code comments
- **Best Practices:** Follow Selenium and Cucumber documentation guidelines
