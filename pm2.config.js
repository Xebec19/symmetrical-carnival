module.exports = {
  apps: [
    {
      name: "blog-api",
      script: "build",
      autorestart: true,
      instances: 1,
      autorestart: true,
      watch: false,
      exec_mode: "cluster",
      env_production: {
        serverEnvironment: "production",
      },
    },
  ],
};
