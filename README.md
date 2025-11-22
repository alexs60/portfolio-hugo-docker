# Personal Portfolio & Infrastructure

This repository contains the infrastructure-as-code and source content for my personal portfolio website. It utilizes a **Docker Compose** architecture with **Caddy** as the edge router (reverse proxy) and **Hugo** for static site generation.

## 🏗 Architecture

* **Reverse Proxy:** Caddy (Handles SSL termination, Auto-HTTPS, and routing).
* **Application:** Nginx (Serves the static HTML/CSS compiled by Hugo).
* **Theme:** [Hugo Coder](https://github.com/luizdepra/hugo-coder).
* **Hosting:** IONOS VPS (Ubuntu).

---

## 💻 Local Development (macOS)

I use the native Hugo binary for local development to ensure fast feedback loops (Live Reload).

### Prerequisites
1.  **Install Hugo (Extended Edition):**
    * The "Extended" version is required for SCSS compilation.
    ```bash
    brew install hugo
    ```

2.  **Initialize Theme Submodules:**
    * Critical step to download the theme files.
    ```bash
    git submodule update --init --recursive
    ```

### Running the Server
1.  Navigate to the portfolio service:
    ```bash
    cd services/portfolio
    ```
2.  Start the local server with drafts enabled:
    ```bash
    hugo server -D
    ```
3.  Open your browser to: `http://localhost:1313`

### Making Changes
1.  Edit content in `services/portfolio/content/`.
2.  Edit config/layout in `services/portfolio/hugo.yaml`.
3.  Commit and push changes to `main`.

---

## 🐳 Local Deployment (Docker)

To run the full stack (Caddy + Nginx) locally as it runs in production:

1.  **Initialize Submodules:**
    *   Ensure the theme files are present before building the container.
    ```bash
    git submodule update --init --recursive
    ```

2.  **Build and Run:**
    ```bash
    docker compose up -d --build
    ```

3.  **Access:**
    *   Site: `http://localhost`
