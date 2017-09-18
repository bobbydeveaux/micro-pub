node('master') {
  stage('Unit Tests') {
    git url: "https://github.com/bobbydeveaux/micro-pub.git"
  }
  stage('Build Bin') {
    sh "go get -v -d ./..."
    sh "CGO_ENABLED=0 GOOS=linux go build -o micro-pub ."
  }
  stage('Build Image') {
    sh "oc start-build micro-pub --from-file=. --follow"
  }
  stage('Deploy') {
    openshiftDeploy depCfg: 'micro-pub', namespace: 'fbac'
    openshiftVerifyDeployment depCfg: 'micro-pub', replicaCount: 1, verifyReplicaCount: true
  }
}