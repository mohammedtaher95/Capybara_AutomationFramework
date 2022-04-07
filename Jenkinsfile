Pipeline
{
agent { docker { image 'ruby:2.6.1' } }

node {
    stage('Get latest Pulls') { // for display purposes
        // Get some code from a GitHub repository
        git 'https://github.com/mohammedtaher95/Capybara_AutomationFramework.git'
        // Get the Maven tool.
        // ** NOTE: This 'M3' Maven tool must be configured
        // **       in the global configuration.
    }

    stage('Starting Grid') { // for display purposes
            if (isUnix()) {
                sh "docker-compose up -d"
            }
            else
            {
               bat("docker-compose up -d")
            }
    }

    stage('Installing Bundles') {
            // Run the maven build
            withEnv(["MVN_HOME=$mvnHome"]) {
                if (isUnix()) {
                    sh 'gem install bundler'
                    sh 'bundle install'
                } else {
                    bat("gem install bundler")
                    bat("bundle install")
                }
            }
        }
    stage('Run Tests') {
        // Run the maven build
        withEnv(["MVN_HOME=$mvnHome"]) {
            if (isUnix()) {
                sh 'rspec Basic_Features/spec/'
            } else {
                bat('rspec Basic_Features/spec/')
            }
        }
    }

    stage('Teardown Grid') { // for display purposes
                if (isUnix()) {
                    sh "docker-compose down"
                }
                else
                {
                   bat("docker-compose down")
                }
        }
}

}
