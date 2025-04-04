pipeline {
    agent any
    environment {
        AZURE_CREDENTIALS_ID = 'azure-service-principal'
        RESOURCE_GROUP = 'rg-jenkins'
        APP_SERVICE_NAME = 'linapptanishq'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'master', url: 'https://github.com/TanishqJecrc/JenkinsTerraformWebAPI.git'
            }
        }
         stage('Terraform Init') {
                steps {
                    dir('Terraform') {
                        bat 'terraform init'
                    }
                }
          }
          stage('Terraform Plan & Apply') {
            steps {
                dir('Terraform') {
                    bat 'terraform plan -out=tfplan'
                    bat 'terraform apply -auto-approve tfplan'
                }
            }
        }

        stage('Build') {
            steps {
                dir('WebAPI') {
                    bat 'dotnet publish -c Release -o ./publish'
                    bat 'powershell Compress-Archive -Path ./publish/* -DestinationPath publish.zip'
                }
                
            }
        }


        stage('Deploy') {
            steps {
               dir('WebAPI') {
                    withCredentials([azureServicePrincipal(credentialsId: AZURE_CREDENTIALS_ID)]) {
                    bat "az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET --tenant $AZURE_TENANT_ID"
                    
                    bat "az webapp deploy --resource-group $RESOURCE_GROUP --name $APP_SERVICE_NAME --src-path ./publish.zip --type zip"
                }
                }
                   
            }
        }
    }

    post {
        success {
            echo 'Deployment Successful!'
        }
        failure {
            echo 'Deployment Failed!'
        }
    }
}
