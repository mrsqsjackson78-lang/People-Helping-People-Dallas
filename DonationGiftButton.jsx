
// DonationGiftButton.jsx
import { useState } from 'react';
import './DonationGiftButton.css';

export default function DonationGiftButton() {
  const handleDonate = (provider) => {
    const links = {
      stripe: 'https://checkout.stripe.com/pay/YOUR_STRIPE_LINK',
      paypal: 'https://www.paypal.com/donate/?hosted_button_id=YOUR_PAYPAL_ID',
      cashapp: 'https://cash.app/$YOURCASHTAG'
    };
    window.location.href = links[provider];
  };

  return (
    <div className="donation-container">
      <button className="gift-button" onClick={() => handleDonate('stripe')}>
        <span className="gift-icon">🎁<span className="ribbon">🎀</span></span>
        <span className="gift-text">Help Us Help Others 🎁<small>(Optional donation)</small></span>
      </button>
      <p className="donation-note">Donations are optional and help keep the app running.</p>
    </div>
  );
}
