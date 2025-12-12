
# AWS ECS CI/CD Starter (No Server SSH)

Ye repo aap direct GitHub par upload kar sakte hain. Isme **ECS Fargate** ke liye CI/CD workflow diya gaya hai, jisse AWS par deployment **automatically** ho jaayega—**no manual server commands**.

## Quick Start

1. **GitHub par repo banaayein** aur is ZIP ko upload karein.
2. `infra/ecs/README_ECS_SETUP.md` follow karke AWS me ECR, ECS Cluster/Service, aur IAM role (OIDC) set karein.
3. GitHub repo ke **Settings → Secrets and variables → Actions** me `AWS_IAM_ROLE_ARN` set karein.
4. `main` branch par push karein. GitHub Actions image build karke ECR me push karega aur ECS service ko nayi image se update karega.

## Files Overview

- `src/server.js` – Simple Express server with `/health` endpoint
- `package.json` – Node dependencies/scripts
- `Dockerfile` – Production image build
- `.github/workflows/deploy-ecs.yml` – CI/CD pipeline (GitHub Actions → ECR → ECS)
- `.env.example` – Env placeholders (real secrets ko AWS Secrets Manager me rakhein)
- `.gitignore` – Common ignores
- `infra/ecs/README_ECS_SETUP.md` – AWS setup guide (one-time)

## Pipeline Logic

- Push to `main` →
  - Build Docker image (Node 20)
  - Login to ECR, push image (`tag = commit SHA`)
  - Fetch current task definition, replace container image, register new revision
  - Update ECS service, wait until stable

## Notes

- Region default `ap-south-1` hai; jarurat ho to workflow me change karein.
- Agar aap ALB use karte hain, health check path `/health` rakhein.
- Runtime secrets (DB URL, JWT secret, etc.) ko **AWS Secrets Manager** se inject karein (Task Definition me environment/secret settings).

## Troubleshooting

- **Permission errors**: IAM role me ECR, ECS aur CloudWatch permissions add karein.
- **Service not updating**: Ensure ECS service aur task definition names workflow ke `env` me sahi set hain.
- **Health check fail**: ALB target group me `/health` path sahi ho.
