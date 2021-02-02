pipeline {
  agent any
  stages {
    stage('clone') {
      steps {
        git(url: 'https://github.com/jeremycook123/devops-webapp1/pulls', branch: 'master', poll: true)
      }
    }

  }
}