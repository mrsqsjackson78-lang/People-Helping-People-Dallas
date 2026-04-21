"use client";
import React, { createContext, useContext, useEffect, useState } from "react";

type Lang = "en" | "es";

const LanguageContext = createContext<any>(null);

export const LanguageProvider = ({ children }: { children: React.ReactNode }) => {
  const [lang, setLang] = useState<Lang>("en");
  const [t, setT] = useState<any>({});

  useEffect(() => {
    const saved = localStorage.getItem("lang") as Lang;
    if (saved) setLang(saved);
  }, []);

  useEffect(() => {
    fetch(`/i18n/${lang}.json`)
      .then(res => res.json())
      .then(setT);
    localStorage.setItem("lang", lang);
  }, [lang]);

  const toggle = () => setLang(lang === "en" ? "es" : "en");

  return (
    <LanguageContext.Provider value={{ lang, t, toggle }}>
      {children}
    </LanguageContext.Provider>
  );
};

export const useLanguage = () => useContext(LanguageContext);