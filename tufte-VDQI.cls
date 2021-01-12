% Loading memoir

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tufte-VDQI}[2020/01/31 v.1.000 Tufte style from VDQI via memoir]
\LoadClass{memoir}

% Packages

\RequirePackage[standard]{ntheorem} % load early, so amssymb is loaded before newtxmath
\RequirePackage{fontspec}
\setmainfont{fbb}
\RequirePackage[libertine,vvarbb]{newtxmath}
\RequirePackage{amstext}
\RequirePackage{ragged2e}
\RequirePackage{xspace}
\RequirePackage{graphicx}
\RequirePackage{soul}
\RequirePackage[usenames,dvipsnames]{xcolor}
\definecolor{splinkcolor}{rgb}{.0,.2,.4}
\RequirePackage[colorlinks,breaklinks,
                linkcolor=splinkcolor,
                urlcolor=splinkcolor,
                citecolor=splinkcolor,
                filecolor=splinkcolor,
                plainpages=false,
                pdfpagelabels,
                pdfstartview=FitH]{hyperref}
\RequirePackage[backend=biber,
                style=unified,
                natbib,
                maxcitenames=3,
                maxbibnames=99,
                casechanger=latex2e]{biblatex}

% MEMOIR LAYOUT

\setlength{\baselineskip}{14pt}
\setlength{\normalbaselineskip}{14pt}

% GEOMETRY

\settypeblocksize{44\baselineskip}{26pc}{*}
\setlrmargins{1in}{*}{*}
\setulmargins{1in}{*}{*}
\setheadfoot{\baselineskip}{\baselineskip}
\setheaderspaces{*}{2\baselineskip}{*}
\setmarginnotes{2pc}{12pc}{\onelineskip}
\marginparmargin{right}
\checkandfixthelayout
\setlength{\evensidemargin}{\oddsidemargin}

% TEXT

% ragged2e provides ragged justification with hyphenation
\AtBeginDocument{\RaggedRight}
\setmpjustification{\RaggedLeft}{\RaggedRight}
\setlength{\RaggedRightParindent}{1.0pc}

\setlength{\parindent}{1pc}
\setlength{\parskip}{0pt}
\linespread{1.17} % linespacing ~ 14pt

% Strong widow and orphan control

\clubpenalty10000
\widowpenalty10000

% French Spacing

\frenchspacing

% URLs

\urlstyle{rm}

% Title page

\newlength{\drop}
\newcommand*{\titleVDQI}{% titlepage styling based on Tufte's "The Visual Display ..."
  \begingroup
  \drop = 0.08\textheight
  \vspace*{\drop}
  {\LARGE\itshape\theauthor}\\[2\drop]
  {\HUGE\thetitle\par}
  \vfill
  {\Large\itshape\thedate}
  \vspace*{\drop}
  \endgroup}

% Table of contents

\setcounter{tocdepth}{0}
\settocpreprocessor{part}{%
  \let\tempf@rtoc\f@rtoc%
  \def\f@rtoc{%
    \texorpdfstring{\addfontfeatures{LetterSpace=20}\MakeTextUppercase{\tempf@rtoc}\normalfont}%
    {\tempf@rtoc}}%
}
\renewcommand*{\cftpartfont}{\Large}
\renewcommand*{\cftpartname}{\addfontfeatures{LetterSpace=20}PART\space\normalfont}
\renewcommand\partnumberlinebox[2]{#2\quad}
\cftpagenumbersoff{part}
\setpnumwidth{2em}
\setrmarg{3.55em}
\setlength{\cftchapterindent}{1.5em}
\renewcommand*{\cftchapterfont}{\Large\itshape}
\renewcommand{\cftchapterpagefont}{\itshape}
\renewcommand{\cftchapterleader}{}
\renewcommand{\cftchapterafterpnum}{\cftparfillskip}

% Part page

\newlength{\centeringlength}
\calccentering{\centeringlength}

\renewcommand*{\beforepartskip}{%
  \null\vskip 0pt plus 0.3fil%
  \begin{adjustwidth*}{\centeringlength}{-\centeringlength}%
  \begin{center}}
    
\renewcommand*{\afterpartskip}{%
  \vskip 0pt plus 0.7fil%
  \end{center}%
  \end{adjustwidth*}}
  
\renewcommand{\partnamefont}{\addfontfeatures{LetterSpace=20}\LARGE\MakeUppercase}
\renewcommand{\partnumfont}{\normalfont\LARGE}
\renewcommand{\parttitlefont}{\normalfont\Huge}

\aliaspagestyle{part}{empty}
  
% Chapter style

\makechapterstyle{tufte}{%
  \thispagestyle{empty}
  \renewcommand*{\printchaptername}{}
  \renewcommand*{\chapnumfont}{\itshape\huge}
  \renewcommand*{\printchapternum}{\chapnumfont \thechapter\quad}
  \renewcommand*{\afterchapternum}{}
  \renewcommand*{\chaptitlefont}{\huge\rmfamily\itshape}
}
\aliaspagestyle{chapter}{empty}
\chapterstyle{tufte}

% Page style

\newlength{\fullwidth}
\setlength{\fullwidth}{\textwidth}
\addtolength{\fullwidth}{\marginparsep}
\addtolength{\fullwidth}{\marginparwidth}

\makepagestyle{tufte-headings}

\makepsmarks{tufte-headings}{%
  \uppercaseheads
  \createmark{part}{left}{nonumber}{\partname\ }{. \ }
  \createmark{chapter}{right}{nonumber}{\chaptername\ }{. \ }
  \renewcommand\sectionmark[1]{}
  \createplainmark{toc}{both}{\contentsname}
  \createplainmark{lof}{both}{\listfigurename}
  \createplainmark{lot}{both}{\listtablename}
  \createplainmark{bib}{both}{\bibname}
  \createplainmark{index}{both}{\indexname}
  \createplainmark{glossary}{both}{\glossaryname}}

\makerunningwidth{tufte-headings}{\fullwidth}
\makeheadposition{tufte-headings}{flushleft}{flushleft}{}{}
\makeevenhead{tufte-headings}{\thepage\quad\addfontfeatures{LetterSpace=20}\leftmark\normalfont}{}{}
\makeoddhead{tufte-headings}{}{}{\addfontfeatures{LetterSpace=20}\rightmark\normalfont\quad\thepage}
\makeevenfoot{tufte-headings}{}{}{}
\makeoddfoot{tufte-headings}{}{}{}

\pagestyle{tufte-headings}

% Sections

\setsecnumdepth{subsection} % If subsections should also be numbered

\setsecheadstyle{\normalfont\Large\itshape}
\setsubsecheadstyle{\normalfont\large\itshape}
\setsubsubsecheadstyle{\normalfont\normalsize\itshape}

% Epigraphs

\setlength{\epigraphwidth}{0.73\textwidth}

% Margin notes

\newcommand{\marginparformat}{%
  \noindent%
  \footnotesize%
  \RaggedRight}
\newcommand{\note}[1]{%
  \strictpagecheck\leavevmode%
  \marginpar{\marginparformat #1}%
  \ignorespaces}

% Lists

\tightlists
\renewcommand*{\descriptionlabel}[1]{\hspace\labelsep\normalfont\itshape #1}
