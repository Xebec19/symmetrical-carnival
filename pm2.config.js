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
  deploy: {
    "blog-api": {
      user: "ubuntu",
      ssh_options: "StrictHostKeyChecking=no",
      host: ["13.127.63.102"],
      key: "~/.ssh/web-server.pem",
      ref: "origin/main",
      repo: "git@github.com:Xebec19/symmetrical-carnival",
      path: "/home/ubuntu/symmetrical-carnival",
      "post-deploy":
        "cd /home/ubuntu/symmetrical-carnival && chmod +x start.sh && ./start.sh",
    },
  },
};
