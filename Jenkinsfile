pipeline {
    agent any

    environment {
        // Variabel biar ngga nulis ulang terus
        SONAR_TOKEN = 'sqp_d884963ebfd2e32bbdbf633393330cf3c9772794'
        IMAGE_NAME  = 'image-materi-jenkins'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/bym-1091/latihan-devops.git'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                script {
                    sh """
                    docker run --rm --network=host \
                    -v "\$(pwd):/usr/src" \
                    sonarsource/sonar-scanner-cli \
                    -Dsonar.projectKey=test \
                    -Dsonar.sources=. \
                    -Dsonar.host.url=http://localhost:9000 \
                    -Dsonar.token=${SONAR_TOKEN}
                    """
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                // Kita pake file yang udah di-rename jadi Dockerfile tadi
                sh "docker build -t ${IMAGE_NAME} ."
            }
        }

        stage('Deploy Locally') {
            steps {
                // Matiin container lama kalo ada, terus jalanin yang baru
                sh """
                docker stop kontainer-latihan || true
                docker rm kontainer-latihan || true
                docker run -d --name kontainer-latihan -p 8085:80 ${IMAGE_NAME}
                """
                echo "Aplikasi jalan di http://localhost:8085"
            }
        }
    }

    post {
        always {
            echo 'Selesai menjalankan pipeline!'
        }
        success {
            echo 'Wanjay sukses bro! Kopi mana kopi? ☕'
        }
        failure {
            echo 'Yah merah... Cek Console Output gih.'
        }
    }
}
