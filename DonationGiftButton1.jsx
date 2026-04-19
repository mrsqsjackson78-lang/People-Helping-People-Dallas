import React, { useState } from "react";
import "./styles.css";

export default function DonationGiftButton({
  brand = {
    primary: "#f4a261",
    accent: "#f7c948",
    text: "#3a2f1c",
    font: "system-ui",
  },
  payments,
  analytics = { enabled: false, onEvent: () => {} }
}) {
  const [open, setOpen] = useState(false);
  const [consent, setConsent] = useState(false);

  const track = (event) =>
    analytics.enabled && consent && analytics.onEvent(event);

  const donate = (url) => {
    track("donate_click");
    window.open(url, "_blank");
  };

  return (
    <div className="donation-wrap" style={{ fontFamily: brand.font }}>
      <button
        className="gift-btn"
        style={{
          background: `linear-gradient(135deg, ${brand.accent}, ${brand.primary})`,
          color: brand.text,
        }}
        onClick={() => setOpen(true)}
      >
        🎁<span className="ribbon">🎀</span>
        <span className="text">
          Help Us Help Others 🎁
          <small>(Optional donation)</small>
        </span>
      </button>

      <p className="impact">Your support keeps the lights on.</p>

      {open && (
        <div className="modal">
          <div className="card">
            <h3>Support Our Mission</h3>
            <p>Donations are optional.</p>

            <button onClick={() => donate(payments.stripe)}>
              Stripe / Apple Pay
            </button>
            <button onClick={() => donate(payments.paypal)}>PayPal</button>
            <button onClick={() => donate(payments.cashapp)}>Cash App</button>

            <label className="consent">
              <input
                type="checkbox"
                onChange={(e) => setConsent(e.target.checked)}
              />
              Allow anonymous analytics
            </label>

            <button onClick={() => setOpen(false)}>Close</button>

            <p className="scripture">
              “Whatever you did for one of the least of these…” — Matthew 25:40
            </p>
          </div>
        </div>
      )}
    </div>
  );
}
