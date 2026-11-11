FROM nginx:alpine

# Jenkins CI/CD Practical Guide | HTML, VS Code, GitHub and Docker

COPY index.html /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
