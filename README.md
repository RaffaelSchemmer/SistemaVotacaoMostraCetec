<img alt="GoStack" src="https://storage.googleapis.com/golden-wind/bootcamp-gostack/header-desafios.png" />

## :rocket: About the Code

In this GIT repository, you will find a BE (back-end) application that stores a portfolio of repositories. With this code, you can create, list, update and remove repositories. In addition, each repo can be "liked".

We use HTTP methods like GET/POST/PUT/DELETE to allow communication of REST webservices. In BE, we use express to handle the communication, and UUID to manage the ID of users. JSON is the metadata, that allow users to send and receive data of web services.

### Application Routes

- **`POST /repositories`**: This Route receivers `title`, `url` and `techs` (inside body request). When a new GIT repo is create, he will be store like a format: `{ id: "uuid", title: 'Desafio Node.js', url: 'http://github.com/...', techs: ["Node.js", "..."], likes: 0 }`; 

- **`GET /repositories`**: This Route list all GIT repositories;

- **`PUT /repositories/:id`**: This route should only change `title`, `url` and `techs` of repository that own `id` equal than `id` present in the route parameters;

- **`DELETE /repositories/:id`**: The route must delete the repository with `id` present in the route parameters;

- **`POST /repositories/:id/like`**: The route must increase the "likes" number of repository chosen through `id` present in route parameters, for each call on this route, the number of likes must be increased by 1;

### TDDs of Project

All route can be tested using jest and supertest.

## :computer: Installing Requirements

- yarn add express
- yarn add nodemon
- yarn add cors
- yarn add uuidv4
- yarn add http
- yarn add https
- yarn add fs
- yarn dev (to automatic development)
- yarn test (to apply all the tests)

## :memo: License

This project uses MIT license. See the file [LICENSE](LICENSE) to more details.

---

Made with 💜 by Raffael Schemmer :wave: [See my Online CV!](https://www.raffael.dev)
