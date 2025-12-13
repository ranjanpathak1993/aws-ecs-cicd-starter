
# My Node EC2 App (AWS CodePipeline + CodeDeploy)

This repository contains a minimal Node.js app and deployment files for an EC2 deployment via AWS CodePipeline (Source: GitHub), CodeBuild (buildspec), and CodeDeploy (appspec + lifecycle scripts).

## Structure
- `package.json` – Node dependencies and scripts
- `src/server.js` – Express server (port 3000)
- `buildspec.yml` – CodeBuild instructions
- `appspec.yml` – CodeDeploy instructions
- `scripts/` – Lifecycle hook scripts (BeforeInstall, AfterInstall, ApplicationStart, ApplicationStop)

## Run locally
```bash
npm install
npm start
# http://localhost:3000
```

## Notes
- Ensure the CodeDeploy agent is installed on EC2.
- Security Group should allow inbound traffic (port 3000) or use a reverse proxy/ALB.
- The pipeline deploy stage must point to your CodeDeploy Application and Deployment Group.
