pipeline {
  agent any
  triggers {
    cron('H 2 * * *')  // Runs at ~2 AM
  }
  stages {
    stage('Backup Jenkins to S3') {
      steps {
        sh 'bash scripts/backup.sh'
      }
    }
  }
}
