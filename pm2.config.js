module.exports = {
  apps: [
    {
      name: "blog-api",
      script: "start.sh",
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
