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
\RequirePackage[hidelinks, unicode=true]{hyperref}
\RequirePackage{xkeyval}
\RequirePackage{xparse}

\setlength{\parindent}{0pt} % No paragraph indents
\setlength{\parskip}{1em} % Paragraphs separated by one line
\renewcommand{\headrulewidth}{0pt} % Removes line in header
\geometry{legalpaper, portrait, margin=1in}
\setlength{\headheight}{20pt}
\setlength{\headsep}{0.2in}
\newcommand{\pagesetup}{\pagestyle{fancy}\fancyhf{}\rhead{\thepage}\lhead{\hyperlink{toc}{Stuyvesant Class of 2022: Complex Analysis of a Single Variable}}}
\addtocontents{toc}{\protect\thispagestyle{empty}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\docformat}{
  \begin{titlepage}
     \begin{center}
          \vspace*{5cm}

          \Huge{Complex Analysis of a Single Variable}


          \vspace{3 cm}
          \Large{Stuyvesant Class of 2022}

          \vspace{0.25cm}
          \large{Joshua L. Yagupsky, Nathaniel J. Strout, Francis Zweifler}

          \vspace{3 cm}
          \Large{Created February 15th, 2022}

          \vspace{0.25 cm}
          Complex Calculus, Mr. Stern
         \vfill
      \end{center}
  \end{titlepage}

  \pagestyle{empty}
  \hypertarget{toc}{\tableofcontents}
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
    \begin{boxsec}{\hypertarget{#1}{\textbf{Lemma \thelemm} (#1):}}
  }
}
{\end{boxsec}}

\renewenvironment{theorem}[1][]{
  \refstepcounter{theo}
  \ifstrempty{#1}{
    \begin{boxsec}{\textbf{Theorem \thetheo}:}
  }
  {
    \begin{boxsec}{\hypertarget{#1}{\textbf{Theorem \thetheo} (#1):}}
  }
}
{\end{boxsec}}

\newenvironment{definition}[1][]{
  \refstepcounter{defi}
  \ifstrempty{#1}{
    \begin{boxsec}{\textbf{Definition \thedefi}:}
  }
  {
    \begin{boxsec}{\hypertarget{#1}{\textbf{Definition \thedefi} (#1):}}
  }
}
{\end{boxsec}}

\renewenvironment{corollary}[1][]{
  \refstepcounter{coro}
  \ifstrempty{#1}{
    \begin{boxsec}{\textbf{Corollary \thecoro}:}
  }
  {
    \begin{boxsec}{\hypertarget{#1}{\textbf{Corollary \thecoro} (#1):}}
  }
}
{\end{boxsec}}

\newcommand{\norm}[1]{\lVert #1 \rVert}
\newcommand{\modulus}[1]{\left\lvert #1 \right\rvert}
\newcommand{\innerprod}[2]{\left<#1,#2\right>}
\newcommand{\conj}[1]{\overline{#1}} % Conjugate of a complex number
\newcommand{\nbhd}[1]{\operatorname{\mathcal{N}}({#1})}
\newcommand{\disk}[2]{\operatorname{D_{#2}} ({#1})}
\newcommand{\pnbhd}[1]{\operatorname{\mathcal{N^*}}({#1})}
\newcommand{\pdisk}[2]{\operatorname{D^*_{#2}} ({#1})}
\newcommand{\rnbhd}[2]{\operatorname{\mathcal{N}_{#2}}({#1})}
\newcommand{\rpnbhd}[2]{\operatorname{\mathcal{N^*}_{#2}}({#1})}
\newcommand{\ind}[2]{\operatorname{ind}({#1},{#2})}
\newcommand{\boundary}[1]{\operatorname{bd}({#1})}
\newcommand{\interior}[1]{\operatorname{int}({#1})}
\newcommand{\exterior}[1]{\operatorname{ext}({#1})}
\newcommand{\domain}[1]{\operatorname{dom}({#1})}
\newcommand{\range}[1]{\operatorname{ran}({#1})}
\newcommand{\region}[1]{{#1}\overset{\text{reg}}{\subseteq}\mathbb{C}}
\NewDocumentCommand {\seq} {m O{n} O{#2}}{\left({#1}_{#2}\right)^\infty_{{#3}=0}}
\NewDocumentCommand {\fn} {m m m O{}}{\ifstrempty{#4}{{#1} \colon {#2} \longrightarrow {#3}}{{#1} \colon {#2} \xlongrightarrow{#4} {#3}}}
\newcommand{\rpart}[1]{\operatorname{Re}({#1})}
\newcommand{\ipart}[1]{\operatorname{Im}({#1})}
\newcommand{\C}{\mathbb{C}}
\newcommand{\R}{\mathbb{R}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtBeginDocument{\docformat}
