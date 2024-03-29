pipeline
        {
            agent any

            stages {
                stage('Get latest Pulls') { // for display purposes
                    // Get some code from a GitHub repository
                    steps {
                        git 'https://github.com/mohammedtaher95/Capybara_AutomationFramework.git'
                    }
                }

                stage('Starting Grid') {
                    steps {
                        script {
                            if (isUnix()) {
                                sh "docker-compose up -d"
                            } else {
                                bat("docker-compose up -d")
                            }
                        }
                    }
                }

                stage('Installing Bundles') {
                    steps {
                        script {
                            if (isUnix()) {
                                sh 'cd Basic_Features'
                                sh 'gem install bundler'
                                sh 'bundle install'
                            } else {
                                dir('Basic_Features') {
                                    bat('gem install bundler')
                                    bat('bundle install')
                                }
                            }
                        }
                    }
                }

                stage('Run Tests') {
                    steps {
                        script {
                            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                if (isUnix()) {
                                    sh 'rspec spec/'
                                } else {
                                    dir('Basic_Features') {
                                        bat('bundle exec rspec spec/')
                                    }
                                }

                            }
                        }
                    }
                }

                stage('Teardown Grid') {
                    steps {
                        script {
                            if (isUnix()) {
                                sh "docker-compose down"
                            } else {
                                bat("docker-compose down")
                            }
                        }
                    }
                }
            }
        }

