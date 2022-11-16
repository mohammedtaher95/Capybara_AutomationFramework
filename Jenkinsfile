node
{
       stage('Get latest Pulls') { // for display purposes
               // Get some code from a GitHub repository
               git 'https://github.com/mohammedtaher95/Capybara_AutomationFramework.git'
       }

        stage('Starting Grid') {
                script {
                    if (isUnix()) {
                        sh "docker-compose up -d"
                    }
                    else
                    {
                        bat("docker-compose up -d")
                    }
                }
        }

        stage('Installing Bundles') {
                script {
                    if (isUnix()) {
                        sh 'gem install bundler'
                        sh 'bundle install'
                    }
                    else {
                        bat("gem install bundler")
                        bat("bundle install")
                    }
                }
        }

        stage('Run Tests') {
                script {
                    if (isUnix()) {
                        sh 'rspec Basic_Features/spec/'
                    }
                    else {
                        bat('rspec Basic_Features/spec/')
                    }
                }
        }

        stage('Teardown Grid') {
               script {
                   if (isUnix()) {
                       sh "docker-compose down"
                   }
                   else {
                       bat("docker-compose down")
                   }
               }
         }

}
