
# People Helping People Texas — System Architecture

## Purpose (For App Store Reviewers)
This document explains how the People Helping People Texas app protects users, prevents fraud, and complies with App Store and Google Play policies. Identity verification is **manual, consent-based, and privacy-minimized**.

---

## High-Level Architecture

![System Architecture](system.png)

**Reviewer Notes:**
- All data is transmitted over HTTPS
- Backend uses JWT authentication
- Sensitive data is encrypted before storage

---

## Authentication & Notifications

![JWT & Notifications](auth_notifications.png)

- JWT tokens authenticate admins only
- Users authenticate via SMS/email OTP
- Notifications are transactional only (no marketing)

---

## Verification & Safety Workflow

![Verification Flow](verification.png)

**Policy Alignment:**
- Human review (no automated identity decisions)
- Explicit consent required
- Rejection includes explanation & retry option

---

## Database & Data Protection (ERD)

![Database ERD](erd.png)

### Data Retention
- ID images: deleted after 30–90 days
- Verification result: retained as boolean only
- Encryption at rest using OpenSSL

---

## Abuse Prevention
- Content scanned for threats
- Flagged items reviewed by admins

---

## CI/CD & Deployment

- GitHub Actions builds Docker image
- Immutable deployments
- Secrets stored via environment variables

---

## Compliance Summary
✅ User consent
✅ Data minimization
✅ Manual review
✅ Deletion on request
✅ Store policy alignment
