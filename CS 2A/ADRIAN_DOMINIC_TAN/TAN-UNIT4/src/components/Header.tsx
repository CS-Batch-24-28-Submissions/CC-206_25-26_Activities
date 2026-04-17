import { useState } from "react";
import { Link } from "react-router-dom";

const Header = () => {
  const [isMenuOpen, setIsMenuOpen] = useState(false);

  return (
    <header className="flex bg-[var(--color-surface)] h-[clamp(60px,8vw,96px)] px-6 md:px-8 lg:px-12 py-2 sticky top-0 z-50">
      <div className="hidden sm:flex w-full items-center justify-between">
        {/* [L]eft: Banner */}
        <a href="/" className="flex items-center">
          <div className="flex items-center space-x-3 cursor-pointer">
            <img src="code-icon.svg" alt="Code Icon" className="size-6" />
            <p className="
            font-heading font-bold tracking-widest text-[var(--text-primary)]
            transition-all duration-300 ease-out
            hover:-translate-y-0.5 hover:opacity-80
          ">
            DREYYAN
          </p>
          </div>
        </a>

        <div className="
          flex justify-end items-center gap-8
          [&>a]:text-[var(--text-primary)]
          [&>a]:font-body
          [&>a]:font-semibold
          [&>a]:tracking-wider
          [&>a]:text-xs
          [&>a]:md:text-sm
          [&>a]:lg:text-md
          [&>a]:transition
          [&>a]:duration-300
          [&>a]:ease-in-out
          [&>a]:hover:translate-y-[-1px]
        ">
          <Link to="/about-me">ABOUT ME</Link>
          <Link to="/portfolio">PORTFOLIO</Link>
          <Link to="/resume">RESUME</Link>
        </div>
      </div>

      {/* Burger Menu Icon */}
      <div className="ml-auto sm:hidden flex">
        <button
          className="cursor-pointer"
          onClick={() => setIsMenuOpen(!isMenuOpen)}
        >
          <img src="burger-menu-icon.svg" className="size-8 sm:hidden" />
        </button>
      </div>

      {/* Full-screen Mobile Menu */}
      {isMenuOpen && (
        <div className="fixed inset-0 bg-[var(--color-surface)]/96 z-50 flex flex-col items-center justify-center gap-8 sm:hidden font-bold">
          <button onClick={() => setIsMenuOpen(false)} className="fixed top-4 right-6 cursor-pointer">
            <img src="close-icon.svg" className="size-8"/>
          </button>
          <Link to="/" onClick={() => setIsMenuOpen(false)}>HOME</Link>
          <Link to="/about-me" onClick={() => setIsMenuOpen(false)}>ABOUT ME</Link>
          <Link to="/portfolio" onClick={() => setIsMenuOpen(false)}>PORTFOLIO</Link>
          <Link to="/resume" onClick={() => setIsMenuOpen(false)}>RESUME</Link>
        </div>
      )}
    </header>
  );
};

export default Header;
