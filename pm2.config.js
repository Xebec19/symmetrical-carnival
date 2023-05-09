module.exports = {
  apps: [
    {
      script: "build",
      autorestart: true,
    },
  ],
  deploy: {
    "blog-api": {
      user: "ubuntu",
      ssh_options: "StrictHostKeyChecking=no",
      key: "~/.ssh/web-server.pem",
      host: ["13.127.63.102"],
      ref: "origin/main",
      repo: "git@github.com:Xebec19/symmetrical-carnival.git",
      path: "/home/ubuntu/symmetrical-carnival",
      "post-deploy": "chmod +x start.sh && ./start.sh",
    },
  },
};
