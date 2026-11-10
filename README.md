# Eslam Hegazy — Senior Software Engineer Portfolio

A fully responsive, dark-themed portfolio built with **Flutter Web**, showcasing 4+ years of cross-functional engineering experience across Mobile (Flutter/Native Android) and Backend (Java Spring Boot) domains.

🌐 **Live Site:** [eslam-hegazy.github.io/Portofolio-Eslam](https://eslam-hegazy.github.io/Portofolio-Eslam/)

---

## 🚀 Tech Stack

| Layer | Technology |
|---|---|
| Framework | Flutter 3.x (Web target) |
| UI | Material 3, Custom Dark Theme |
| Fonts | Google Fonts (Outfit + Inter) |
| Icons | Font Awesome Flutter v11, Material Icons |
| Links | url_launcher |
| PDF Download | dart:html (web Blob download) |
| CI/CD | GitHub Actions → GitHub Pages |

---

## 📱 Responsive Design

| Breakpoint | Width | Layout |
|---|---|---|
| Mobile | < 640px | Single column, hamburger drawer |
| Tablet | 640–1023px | Adaptive columns |
| Desktop | ≥ 1024px | Full side-by-side layout |

---

## 🗂️ Featured Projects (13)

Covers domains across: Fintech, Healthcare, E-Commerce, Travel & Hospitality, Enterprise/Government, Sports, Community, and Real Estate.

Each project links to its **Google Play** and/or **App Store** listing with real production URLs.

---

## 📄 CV / Résumés

Two specialization-specific CVs are bundled as PDF assets:

- **Senior Mobile Engineer CV** — Flutter & Native Android focus
- **Senior Software Engineer CV** — Java Spring Boot & Backend focus

Both are downloadable directly from the portfolio via the **Download CV** button.

---

## 🏗️ Architecture

```
lib/
├── data/           # Static portfolio data (projects, skills, experience)
├── pages/          # Main portfolio page (single-page scroll)
├── theme/          # AppTheme constants (colors, decorations, glassmorphism)
├── utils/          # Platform-conditional helpers (PDF download)
└── widgets/        # Reusable modal widgets (CV download, case study)

assets/
├── images/         # Profile photo
└── resumes/        # PDF CV files

web/
└── index.html      # Flutter web entry point with $FLUTTER_BASE_HREF

.github/workflows/
└── deploy.yml      # Build & deploy to GitHub Pages on push to main
```

---

## 🛠️ Local Development

```bash
# Install dependencies
flutter pub get

# Run on web (dev server)
flutter run -d web-server --web-port 8080 --web-hostname 127.0.0.1

# Analyze code
flutter analyze

# Run tests
flutter test

# Build for production
flutter build web --release --base-href "/Portofolio-Eslam/"
```

---

## 📦 Deployment

Pushes to `main` automatically trigger the GitHub Actions workflow which:
1. Sets up Flutter stable channel
2. Runs `flutter build web --release --base-href "/Portofolio-Eslam/"`
3. Deploys `build/web/` to the `gh-pages` branch via `peaceiris/actions-gh-pages`

---

*Built with ❤️ using Flutter Web*
