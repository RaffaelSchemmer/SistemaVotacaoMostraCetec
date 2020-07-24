<img alt="GoStack" src="https://s7.gifyu.com/images/banner1e0b6f65bf2500fd.gif" />

<div align="center">
  <h4>
    .
    .
    .
    .
  </h4>
</div>

:star: Star us on GitHub — it helps!

## :rocket: About the Application


In this GitHub repository, you will find a complete application (full-stak) that uses many technologies to allow 

stores a portfolio of repositories. With this code, you can create, list, update and remove repositories. In addition, each repo can be "liked".

We use HTTP methods like GET/POST/PUT/DELETE to allow communication of REST webservices. In BE, we use express to handle the communication, and UUID to manage the ID of users. JSON is the metadata, that allow users to send and receive data of web services.

### Application Routes

- **`POST /repositories`**: This Route receivers `title`, `url` and `techs` (inside body request). When a new GIT repo is create, he will be store like a format: `{ id: "uuid", title: 'Desafio Node.js', url: 'http://github.com/...', techs: ["Node.js", "..."], likes: 0 }`; 

- **`GET /repositories`**: This Route list all GIT repositories;

- **`PUT /repositories/:id`**: This route should only change `title`, `url` and `techs` of repository that own `id` equal than `id` present in the route parameters;

- **`DELETE /repositories/:id`**: The route must delete the repository with `id` present in the route parameters;

- **`POST /repositories/:id/like`**: The route must increase the "likes" number of repository chosen through `id` present in route parameters, for each call on this route, the number of likes must be increased by 1;

## ✅&nbsp; Requirements to Installing the Application

## :computer: Requirements to Running the Application

- Server with IPv4 static in Internet
- Server that running Http Web Services (NGINX)
Server with Php 5 or Later

- Computer with Windows Xp or Later
- Computer with Browser like Chrome or Internet Explorer

## ❤️&nbsp; Community and Contributions

## 📫&nbsp; Have a question? Want to chat? Ran into a problem?

## 🤝&nbsp; Found a bug? Missing a specific feature?

---

## 📘&nbsp; License

This project uses MIT license. See the file [LICENSE](LICENSE) to more details.

---

Made with 💜 by Raffael Schemmer :wave: [See my Online CV!](https://www.raffael.dev)
