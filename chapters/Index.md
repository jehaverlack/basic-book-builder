\clearpage
\thispagestyle{plain}
\markboth{Index}{Index}

\let\oldclearpage\clearpage
\let\oldcleardoublepage\cleardoublepage
\renewcommand{\clearpage}{}
\renewcommand{\cleardoublepage}{}

\chapter*{Index}
\addcontentsline{toc}{chapter}{Index}

\printindex

\renewcommand{\clearpage}{\oldclearpage}
\renewcommand{\cleardoublepage}{\oldcleardoublepage}

