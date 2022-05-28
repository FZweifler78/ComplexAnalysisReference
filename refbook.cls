\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{refbook}

\LoadClass[12pt, hidelinks]{article}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[utf8]{inputenc}
\RequirePackage{comment}
\RequirePackage{lipsum}
\RequirePackage{fullpage}
\RequirePackage{geometry}
\RequirePackage{amsmath}
\RequirePackage{amssymb, mathtools,empheq,tensor,braket}
\newtheorem{theorem}{Theorem}
\newtheorem{corollary}{Corollary}
\RequirePackage{graphicx,fancyhdr}
\RequirePackage{xcolor}
\RequirePackage{mdframed}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{xkeyval}

\setlength{\parindent}{0pt} % No paragraph indents
\setlength{\parskip}{1em} % Paragraphs separated by one line
\renewcommand{\headrulewidth}{0pt} % Removes line in header
\geometry{legalpaper, portrait, margin=1in}
\setlength{\headheight}{14.49998pt}
\setlength{\headsep}{0.2in}
\newcommand{\pagesetup}{\pagestyle{fancy}\fancyhf{}\rhead{\thepage}\lhead{Stuyvesant Class of 2022: Complex Analysis Reference Sheet}}
\addtocontents{toc}{\protect\thispagestyle{empty}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\docformat}{
  \begin{titlepage}
     \begin{center}
          \vspace*{5cm}

          \Huge{Complex Analysis Reference Book}


          \vspace{3 cm}
          \Large{Stuyvesant Class of 2022}

          \vspace{0.25cm}
          \large{Nathaniel J. Strout, Joshua L. Yagupsky, Francis Zweifler}

          \vspace{3 cm}
          \Large{Created February 15th, 2022}

          \vspace{0.25 cm}
          Complex Calculus, Mr. Stern
         \vfill
      \end{center}
  \end{titlepage}

  \pagestyle{empty}
  \tableofcontents
  \cleardoublepage

  \pagesetup
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Generic environments that other environments will call. Do not use these in the actual tex file!
\newenvironment{boxsec}[1]
    { \begin{mdframed}[nobreak=true,backgroundcolor=gray!20]  #1 \\}
    {  \end{mdframed}}

\newenvironment{psec}[1]
    {\textit{#1:}}
    {}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Actual environments here, along with their corresponding counters.
\newenvironment{proof}{\begin{psec}{Proof}}{\end{psec}}
\newenvironment{solution}{\begin{psec}{Solution}}{\end{psec}}

\newcounter{theo}[section]\setcounter{theo}{0}
\renewcommand{\thetheo}{\arabic{section}.\arabic{theo}}

\newcounter{lemm}[section]\setcounter{lemm}{0}
\renewcommand{\thelemm}{\arabic{section}.\arabic{lemm}}

\newcounter{defi}[section]\setcounter{defi}{0}
\renewcommand{\thedefi}{\arabic{section}.\arabic{defi}}

\newcounter{coro}[theo]\setcounter{coro}{0}
\renewcommand{\thecoro}{\thetheo.\arabic{coro}}

\newcounter{probo}[section]\setcounter{probo}{0}
\renewcommand{\theprobo}{{\arabic{section}.\arabic{probo}}}

\newcommand{\noSectionNumbering}{
  \renewcommand{\thetheo}{\arabic{theo}}
  \renewcommand{\thelemm}{\arabic{lemm}}
  \renewcommand{\thedefi}{\arabic{defi}}
  \renewcommand{\theprobo}{\arabic{probo}}
}

\newenvironment{lemma}[1][]{
  \refstepcounter{lemm}
  \ifstrempty{#1}{
    \begin{boxsec}{\textbf{Lemma \thelemm}:}
  }
  {
    \begin{boxsec}{\textbf{Lemma \thelemm} (#1):}
  }
}
{\end{boxsec}}

\renewenvironment{theorem}[1][]{
  \refstepcounter{theo}
  \ifstrempty{#1}{
    \begin{boxsec}{\textbf{Theorem \thetheo}:}
  }
  {
    \begin{boxsec}{\textbf{Theorem \thetheo} (#1):}
  }
}
{\end{boxsec}}

\newenvironment{definition}[1][]{
  \refstepcounter{defi}
  \ifstrempty{#1}{
    \begin{boxsec}{\textbf{Definition \thedefi}:}
  }
  {
    \begin{boxsec}{\textbf{Definition \thedefi} (#1):}
  }
}
{\end{boxsec}}

\renewenvironment{corollary}[1][]{
  \refstepcounter{coro}
  \ifstrempty{#1}{
    \begin{boxsec}{\textbf{Corollary \thecoro}:}
  }
  {
    \begin{boxsec}{\textbf{Corollary \thecoro} (#1):}
  }
}
{\end{boxsec}}

\newenvironment{problem}[1][]{
  \refstepcounter{probo}
  \ifstrempty{#1}{
    \begin{boxsec}{\textbf{Problem \theprobo}:}
  }
  {
    \begin{boxsec}{\textbf{Problem #1}:}
  }
}
{\end{boxsec}}

\newcommand{\norm}[1]{\lVert #1 \rVert}
\newcommand{\modulus}[1]{\left\lvert #1 \right\rvert}
\newcommand{\innerprod}[2]{\left<#1,#2\right>}
\newcommand{\conj}[1]{\overline{#1}} % Conjugate of a complex number
\newcommand{\nbhd}[1]{\operatorname{\mathcal{N}}(#1)}
\newcommand{\disk}[2]{\operatorname{D_#2} (#1)}
\newcommand{\pnbhd}[1]{\operatorname{\mathcal{N^*}}(#1)}
\newcommand{\pdisk}[2]{\operatorname{D^*_#2} (#1)}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtBeginDocument{\docformat}
