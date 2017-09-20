% hitda.cls
% class for diploma theses at the tgm-hit
% 2017-Mar-09 Christoph Roschger croschger (at) tgm.ac.at
\ProvidesClass{hitda}[2017/02/01 version 0.1 Diploma thesis]
\NeedsTeXFormat{LaTeX2e}

\newcommand{\schwerpunkt}{n.a.}
\DeclareOption{medt}{\renewcommand{\schwerpunkt}{Medientechnik}}
\DeclareOption{syt}{\renewcommand{\schwerpunkt}{Systemtechnik}}

\newcommand{\sjahr}{2017}
\DeclareOption{2017}{\renewcommand{\sjahr}{2016/17}}
\DeclareOption{2018}{\renewcommand{\sjahr}{2017/18}}
\DeclareOption{2019}{\renewcommand{\sjahr}{2018/19}}
\DeclareOption{2020}{\renewcommand{\sjahr}{2019/20}}

% TODO ...

\DeclareOption{green}{\renewcommand{\headlinecolor}{\color{green}}}
\DeclareOption{red}{\renewcommand{\headlinecolor}{\color{slcolor}}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax


\ProcessOptions \relax

\LoadClass[a4paper,12pt]{book}

\RequirePackage[left=1in,right=1in,top=1in,bottom=1in]{geometry}
\RequirePackage[utf8]{inputenc}
\RequirePackage{booktabs}
\RequirePackage{url}
\RequirePackage{ngerman}
\RequirePackage{pdfpages}
\RequirePackage[absolute]{textpos}
\RequirePackage{emptypage}
\RequirePackage{xcolor}
\RequirePackage{hyperref}
\RequirePackage[toc]{glossaries}


\hypersetup{colorlinks=true, linkcolor=blue}


\RequirePackage{fancyhdr}

\RequirePackage[Sonny]{fncychap}

\RequirePackage{titlesec}

\titleformat{\section}
  {\normalfont\sffamily\Large\bfseries}
  {\thesection}{1em}{}
  
\let\oldtableofcontents\tableofcontents
\renewcommand{\tableofcontents}{
\sffamily
\oldtableofcontents
\rmfamily
}

\let\oldtitlepage\titlepage
\let\endoldtitlepage\endtitlepage

\linespread{1.25}

\renewenvironment{titlepage}{
\pagenumbering{roman}
\setcounter{page}{1}
\begin{oldtitlepage}
	\linespread{1}
	\sffamily
   \begin{textblock}{10}(3,1)
   \begin{center}
		{\Large Technologisches Gewerbemuseum}\\[2ex]
		Höhere Lehranstalt für Informationstechnologie\\
		{\small Ausbildungsschwerpunkt \schwerpunkt}
	\end{center}
	\end{textblock}
   \begin{textblock}{3}(1,1.3)
   \includegraphics[width=3cm]{hitda/logo_tgm}
   \end{textblock}
   \begin{textblock}{3}(12,1.3)
   \includegraphics[width=3cm]{hitda/logo_htl}
   \end{textblock}
	\vspace*{4em}   
   \hrule
\vfill	\begin{center}
	{\Huge Diplomarbeit}\\[2em]
	Gesamtprojekt\\[1em]
	{\	\Large
	\makeatletter
	\@title
	\makeatother}	
	\end{center}
	\renewcommand{\familydefault}{\rmdefault}
	\vspace{10em}
}
{

\noindent
ausgeführt im Schuljahr \sjahr\\[1ex]
\hrule
\vspace*{1em}
\noindent
Abgabevermerk:\\
\makebox[19em][l]{%
Datum: \makeatletter
	\@date
	\makeatother
	}
	übernommen von:
\end{oldtitlepage}
\rmfamily
}

\newcount\myloopcounter
\newcommand{\repeatit}[2][10]{%
  \myloopcounter0% initialize the loop counter
  \loop\ifnum\myloopcounter < #1 % Test if the loop counter is < #1
  #2%
  \advance\myloopcounter by 1 % 
  \repeat % start again
}


\newcommand{\declaration}{
\chapter*{Eidesstattliche Erklärung}
Ich erkläre an Eides statt, dass ich den vorliegenden Diplomarbeitsteil/die vorliegende Diplomarbeit selbstständig
und ohne fremde Hilfe verfasst, keine anderen als die angegebenen Quellen und Hilfsmittel benutzt und die den
benutzten Quellen wörtlich und inhaltlich entnommenen Stellen als solche erkenntlich gemacht habe.
\vspace*{4em}%

\repeatit[\value{authors}]{%
\noindent%
\makebox[10em]{\hrulefill} \hspace{3em}\makebox[25em]{\hrulefill} \\%
\makebox[10em][c]{Ort, Datum} \hspace{3em}\makebox[25em][c]{Name, Unterschrift}\\%
\ \\
}
\newpage
}

\newcounter{authors}
\renewcommand{\author}[4]{
\stepcounter{authors}
\noindent {\large #3} \\
\makebox[10em][l]{#1}
\makebox[9em][l]{#2}
\makebox[15em][l]{Betreuer: #4}\\[2em]
}

\newenvironment{abstract-de}{
\chapter*{Zusammenfassung}
}{
\newpage
}

\newenvironment{abstract-en}{
\chapter*{Abstract}
}{
\newpage
}


\newcommand{\secauthor}[1]{
\fancypagestyle{plain}{%
  \rfoot{Autor: #1}%
}
\pagestyle{plain}
}
\newcommand{\nosecauthor}{
\fancypagestyle{plain}{%
  \rfoot{}%
}
\pagestyle{plain}
}

\RequirePackage{listings}
\lstdefinestyle{custompython}{
  belowcaptionskip=1\baselineskip,
  breaklines=true,
  numbers=left,
  xleftmargin=\parindent,
  language=python,
  showstringspaces=false,
  basicstyle=\footnotesize\ttfamily,
  keywordstyle=\bfseries\color{green!40!black},
  commentstyle=\itshape\color{purple!40!black},
  identifierstyle=\color{blue},
  stringstyle=\color{orange},
}
\lstset{escapechar=@,style=custompython}


\lstdefinelanguage{customjavascript}{
  keywords={typeof, new, true, false, catch, function, return, null, catch, switch, var, if, in, while, do, else, case, break},
  keywordstyle=\color{blue}\bfseries,
  ndkeywords={class, export, boolean, throw, implements, import, this},
  ndkeywordstyle=\color{darkgray}\bfseries,
  identifierstyle=\color{black},
  sensitive=false,
  comment=[l]{//},
  morecomment=[s]{/*}{*/},
  commentstyle=\color{purple}\ttfamily,
  stringstyle=\color{red}\ttfamily,
  morestring=[b]',
  morestring=[b]"
}

\lstdefinestyle{customjava}{
  	language=Java,
  	frame=tlrb,
  	aboveskip=3mm,
  	belowskip=6mm,
  	showstringspaces=false,
  	columns=flexible,
  	basicstyle={\small\ttfamily},
  	numbers=none,
  	numberstyle=\tiny\color{gray},
  	keywordstyle=\color{purple},
  	commentstyle=\color{orange},
  	stringstyle=\color{blue},
  	breaklines=true,
  	breakatwhitespace=true
  	tabsize=3,
  	captionpos=b,
}

\lstset{escapechar=@,style=customjava}



\RequirePackage{booktabs}
\RequirePackage{subfig}

\newcommand{\begincontent}{
\pagenumbering{arabic}
\setcounter{page}{1}
}

\makeglossaries
