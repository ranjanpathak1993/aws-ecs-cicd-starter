
# ECS Setup (One-time)

Follow these steps in AWS Console (no server SSH needed):

1. **Create ECR Repository**
   - Name: `your-app`
   - Region: `ap-south-1` (Mumbai)

2. **Create IAM Role for GitHub OIDC**
   - Use `aws-actions/configure-aws-credentials` docs.
   - Trust policy: GitHub OIDC provider.
   - Permissions: ECR (push/pull), ECS (Describe/UpdateService, RegisterTaskDefinition), CloudWatch Logs.
   - Save role ARN as GitHub secret: `AWS_IAM_ROLE_ARN`.

3. **Create ECS Cluster (Fargate)**
   - Networking only (Fargate).

4. **Create Task Definition (Fargate)**
   - Family: `your-app`
   - Container: name `your-app`, image placeholder (will be updated by CI), port 3000.
   - CPU/Memory: e.g., 0.25 vCPU / 0.5GB.
   - Logs: Enable CloudWatch.

5. **Create ECS Service**
   - Cluster: your-ecs-cluster
   - Task definition: `your-app`
   - Desired tasks: 1
   - Load Balancer: (optional) Create ALB with target group, health check path `/health`.

6. **GitHub Secrets**
   - `AWS_IAM_ROLE_ARN`: IAM role to assume via OIDC
   - (Optional) other runtime secrets via AWS Secrets Manager.

After creating these, pushing to `main` will build and deploy automatically.
