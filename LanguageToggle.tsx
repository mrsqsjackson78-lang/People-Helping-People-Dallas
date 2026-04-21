"use client";
import { useLanguage } from "../context/LanguageContext";

export default function LanguageToggle() {
  const { toggle, t } = useLanguage();
  return <button onClick={toggle}>{t.toggle}</button>;
}