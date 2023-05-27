node
{
       stage('Get latest Pulls') { // for display purposes
               // Get some code from a GitHub repository
               git 'https://github.com/mohammedtaher95/Capybara_AutomationFramework.git'

       }

        stage('Starting Grid') {
                    if (isUnix()) {
                        sh "docker-compose up -d"
                    }
                    else
                    {
                        bat("docker-compose up -d")
                    }

        }

        stage('Installing Bundles') {
                    if (isUnix()) {
                        sh 'cd Basic_Features'
                        sh 'gem install bundler'
                        sh 'bundle install'
                    }
                    else {
                        bat("cd Basic_Features")
                        bat("gem install bundler")
                        bat("bundle install")
                    }

        }

        stage('Run Tests') {
                    if (isUnix()) {
                        sh 'rspec spec/'
                    }
                    else {
                        bat('rspec spec/')
                    }
        }

        stage('Teardown Grid') {
                   if (isUnix()) {
                       sh "docker-compose down"
                   }
                   else {
                       bat("docker-compose down")
                   }

         }

}
