/**
 * Jenkins Pipeline for Web UI Automation with Selenium
 * 
 * This pipeline automates the execution of Selenium-based UI tests using Cucumber framework.
 * It runs tests in headless Chrome browser and generates comprehensive test reports.
 * 
 * Pipeline Features:
 * - Automatic workspace cleanup before each build
 * - 1-hour timeout protection to prevent hanging builds
 * - Uses OpenJDK 21 and Gradle for build management
 * - Executes Cucumber tests with Selenium WebDriver
 * - Generates JUnit XML reports for test results
 * - Creates Allure reports for detailed test analysis
 * 
 * Stages:
 * 1. Checkout: Retrieves source code from SCM
 * 2. Test: Runs Cucumber tests in headless Chrome mode
 * 
 * Post Actions:
 * - Always: Publishes JUnit test results and Allure reports
 * - Success: Logs success message when all tests pass
 * - Failure: Logs failure message with guidance to check reports
 * 
 * Requirements:
 * - Jenkins with OpenJDK 21 tool configured as 'openjdk-21'
 * - Jenkins with Gradle tool configured as 'gradle'
 * - JUnit plugin for test result publishing
 * - Allure plugin for enhanced reporting
 * - Chrome browser installed on Jenkins agent for headless execution
 * 
 * @author System Administrator
 * @version 1.0
 * @since 2024
 */
pipeline {
    agent any

    options {
        // Limpiar workspace antes de cada build
        cleanWs()
        
        // Configurar timeout para evitar builds colgados
        timeout(time: 1, unit: 'HOURS')
    }
    
    tools {
        jdk 'openjdk-21'
        gradle 'gradle'
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Test') {
            steps {
                sh './gradlew clean cucumber -Dbrowser=chrome -Dheadless=true'
            }
        }
    }
    
    post {
        always {
            // Publicar resultados JUnit
            junit 'build/test-results/**/*.xml'
            
            // Publicar Allure Report
            allure includeProperties: false, jdk: '', results: [[path: 'build/allure-results']]
        }
        success {
            echo 'All tests passed successfully!'
        }
        failure {
            echo 'Some tests failed. Check the reports for details.'
        }
    }
}
