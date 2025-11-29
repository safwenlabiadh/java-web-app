pipeline {
    agent any

    tools {
        maven 'M3'
        jdk 'JDK11'
    }

    environment {
        SONAR_SCANNER_HOME = tool 'SonarScanner'
        TOMCAT_HOME = '/opt/tomcat'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/votre-username/java-web-app.git',
                    credentialsId: 'github-credentials'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean compile war:war'
            }
            post {
                success {
                    echo '✅ Build réussi!'
                    archiveArtifacts artifacts: 'target/*.war', fingerprint: true
                }
                failure {
                    echo '❌ Build échoué!'
                }
            }
        }

        stage('Tests') {
            steps {
                sh 'mvn surefire:test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }

        stage('SAST - SonarQube Analysis') {
            steps {
                withSonarQubeEnv('sonar-server') {
                    sh '''$SONAR_SCANNER_HOME/bin/sonar-scanner \
                        -Dsonar.projectKey=java-web-app \
                        -Dsonar.projectName=java-web-app \
                        -Dsonar.sources=src/main/java \
                        -Dsonar.tests=src/test/java \
                        -Dsonar.java.binaries=target/classes'''
                }
            }
        }

        stage('Quality Gate') {
            steps {
                timeout(time: 5, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                sh '''
                    # Arrêter Tomcat si nécessaire
                    sudo systemctl stop tomcat || true

                    # Copier le WAR vers le répertoire webapps de Tomcat
                    sudo cp target/java-web-app.war $TOMCAT_HOME/webapps/

                    # Redémarrer Tomcat
                    sudo systemctl start tomcat

                    # Attendre que l'application soit déployée
                    sleep 30
                '''
            }
            post {
                success {
                    echo '✅ Déploiement réussi!'
                    emailext (
                        subject: "SUCCESS: Application déployée - ${env.JOB_NAME}",
                        body: "L'application a été déployée avec succès sur Tomcat.\n\nBuild: ${env.BUILD_URL}",
                        to: "admin@example.com"
                    )
                }
                failure {
                    echo '❌ Déploiement échoué!'
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline terminée - nettoyage...'
            cleanWs()
        }
    }
}