
## Pre-Week Orientation — May 6, 2026

### Entry Point
server/index.ts — this is the file that starts the Express server.

### Port
3001 — app reads process.env.PORT, defaults to 3001 if not set.

### Required Environment Variables
- JWT_SECRET — required, server exits immediately without it
- APP_URL — optional, defaults to localhost
- RESEND_API_KEY — optional, email features won't work without it
- CORS_ORIGINS — optional, has fallback logic
- SENTRY_DSN — optional, error tracking won't work without it

### Dependencies
- bcrypt requires native build tools — Docker base image must support it
- Start script is dev-only (tsx watch) — production Dockerfile needs a different run command
