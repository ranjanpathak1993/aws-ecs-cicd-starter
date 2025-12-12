
const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.get('/health', (req, res) => res.status(200).json({status: 'ok'}));
app.get('/', (req, res) => res.send('Hello from ECS Fargate CI/CD starter!'));

app.listen(PORT, () => {
  console.log(`Server listening on port ${PORT}`);
});
