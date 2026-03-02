\NeedsTeXFormat{LaTeX2e}[1995/12/01]

%% Document if conditions
\newif\if@cropmarkson \@cropmarksonfalse
\newif\if@hyperrefon  \@hyperrefonfalse

%% Workflow if conditions
\newif\ifarticleinfo    \global\articleinfotrue
\newif\if@ProofPDF      \global\@ProofPDFfalse
\newif\if@RevisesPDF    \global\@RevisesPDFfalse
\newif\if@WebPDF        \global\@WebPDFfalse
\newif\if@PrintPDF      \global\@PrintPDFfalse
\newif\if@appendix      \global\@appendixfalse
\newif\if@PapPDF        \global\@PapPDFfalse


%% Template Options
\DeclareOption{a4paper}{\PassOptionsToPackage{a4}{crop}}
\DeclareOption{centre}{\PassOptionsToPackage{center}{crop}}
\DeclareOption{crop}{\global\@cropmarksontrue}
\DeclareOption{nocrop}{\PassOptionsToPackage{off}{crop}\global\@cropmarksonfalse}
\DeclareOption{info}{\PassOptionsToPackage{info}{crop}}
\DeclareOption{noinfo}{\PassOptionsToPackage{noinfo}{crop}}
\DeclareOption{twoside}{\@twosidetrue\@mparswitchtrue}
\DeclareOption{hyperref}{\global\@hyperrefontrue}

%\ExecuteOptions{eqleft}

\DeclareOption{ProofPDF}{%
%\PassOptionsToPackage{pagegrid}{Mypagegrid}%
\AtEndDocument{\IfFileExists{\jobname.qry}{\ifnum\theMSquerynotedisplay>0\thequerynotes\fi}{}}%
\global\@ProofPDFtrue
\global\@cropmarksontrue
\global\@hyperrefontrue
\global\articleinfotrue
\PassOptionsToPackage{running}{lineno}
\PassOptionsToPackage{mathlines}{lineno}
}%

\DeclareOption{RevisesPDF}{%
\AtEndDocument{\IfFileExists{\jobname.qry}{\ifnum\theMSquerynotedisplay>0\thequerynotes\fi}{}}%
\global\@RevisesPDFtrue
\global\@cropmarksontrue
\global\@hyperrefontrue
\global\articleinfotrue
}% Queries to resolve

\DeclareOption{WebPDF}{%
%\AtBeginDocument{\gdef\query[#1]#2{\relax}\gdef\queryspace#1{\relax}\gdef\querytext{\relax}}%
\AtEndDocument{\IfFileExists{\jobname.qry}{\ifnum\theMSquerynotedisplay>0\thequerynotes\fi}{}}%
\global\@WebPDFtrue
\global\@cropmarksonfalse
\global\@hyperrefonfalse
\global\articleinfotrue
}%


\DeclareOption{PrintPDF}{%
%\PassOptionsToPackage{pagegrid}{Mypagegrid}%
\AtEndDocument{\IfFileExists{\jobname.qry}{\ifnum\theMSquerynotedisplay>0\thequerynotes\fi}{}}%
%\AtBeginDocument{\gdef\query[#1]#2{\relax}\gdef\queryspace#1{\relax}\gdef\querytext{\relax}}%
\global\@PrintPDFtrue
\global\@cropmarksonfalse
\global\@hyperrefontrue
\global\articleinfotrue
}%

\DeclareOption{PapPDF}{%
\AtBeginDocument{\gdef\query[#1]#2{\relax}\gdef\queryspace#1{\relax}\gdef\querytext{\relax}}%
\AtEndDocument{\IfFileExists{\jobname.qry}{\ifnum\theMSquerynotedisplay>0\thequerynotes\fi}{}}%
\global\@WebPDFtrue
\global\@cropmarksonfalse
\global\@hyperrefonfalse
\global\articleinfotrue
\global\@PapPDFtrue
}

%% Classfile Options
\DeclareOption{oneside}{\@twosidefalse\@mparswitchfalse}
\DeclareOption{twoside}{\@twosidetrue\@mparswitchtrue}
\let\document@default@language\m@ne

%\ExecuteOptions{twoside}
\ExecuteOptions{twoside,eqleft}
\ProcessOptions

%% To load all others features of article.cls
\LoadClass[twoside,leqno]{article}
%% General Packages Use and required packages to add here
%\RequirePackage{amsmath,amssymb,amsfonts,}
%\RequirePackage{amsmath}
\RequirePackage{./Styles/amsthm}
%\RequirePackage{Mypagegrid}
\RequirePackage{xcolor,soul,url}
\RequirePackage{graphicx,}
%\usepackage{DT-Tables}
\RequirePackage{stfloats}
\RequirePackage[strict]{changepage}
%\RequirePackage{array,xifthen}
%\RequirePackage{marginnote,MTquery}\setlength{\marginparsep}{5pt}
%\RequirePackage{everypage,afterpage}
\usepackage{marginnote}
\RequirePackage{./Styles/DT-Query}
%\RequirePackage[left,mathlines]{lineno}

\RequirePackage{colortbl,booktabs,longtable}
\RequirePackage{dcolumn}
 \newcolumntype{d}[1]{D{.}{.}{#1}} %% Char alignment before and after "dot" alignment
 \newcolumntype{(}[1]{D{(}{(}{#1}} %% Char alignment before and after "(" alignment
 \newcolumntype{)}[1]{D{)}{)}{#1}} %% Char alignment before and after ")" alignment
 \newcolumntype{z}[1]{D{0}{0}{#1}} %% Char alignment before and after "0" alignment
 \newcolumntype{m}[1]{D{-}{-}{#1}} %% Char alignment before and after "minus" alignment
 \newcolumntype{a}[1]{D{+}{+}{#1}} %% Char alignment before and after "plus" alignment
 \newcolumntype{t}[1]{D{\times}{\times}{#1}} %% Char alignment before and after "times" alignment

\RequirePackage{multicol,multirow}
\RequirePackage[figuresright]{rotating}
\RequirePackage{floatpag}
\RequirePackage[most,skins]{tcolorbox}%
%\RequirePackage{xeCJK} %% For Abstract chinese content
\RequirePackage[final]{pdfpages} %% For issue making
\newcommand{\AdvertisementPage}[1]{\includepdf[pages=-,width=7in,height=10in]{#1}\addtocounter{page}{-1}}

\RequirePackage{endnotes}
\RequirePackage{lettrine}

\RequirePackage{wrapfig}%

%% Hyperlinks update
\usepackage{hyperref}%\endinput

%\RequirePackage{breakurl}
\if@hyperrefon
    \hypersetup{draft,
            linkcolor=black,
            bookmarks=false,%
            bookmarksopen=false,%
    }%
\else%
    \hypersetup{%
            colorlinks,
            breaklinks=true,
            plainpages=false,%
            citecolor=black,
            linkcolor=black,
            urlcolor=black,
            bookmarksopen=true,%
            bookmarksnumbered=false,%
            bookmarksdepth=5%
    }%
\fi

\if@WebPDF\relax\else%
%\if@PrintPDF\relax\else%
\if@ProofPDF\relax\else%
%% Setting crops
\usepackage[paperwidth=637.28bp,paperheight=883.89bp]{geometry}
\if@PrintPDF\RequirePackage[pdftex,noinfo,center]{crop}\else\RequirePackage[pdftex,noinfo,center]{crop}\fi
%\advance\stockwidth by 54.05pt
%\advance\stockheight by 54.05pt
\renewcommand*\CROP@@ulc{%
    \begin{picture}(0,0)
        \unitlength\p@\thinlines
        \put(-21,0){\line(1,0){15}}
        \put(0,21){\line(0,-1){15}}
    \end{picture}%
}
\renewcommand*\CROP@@urc{%
    \begin{picture}(0,0)
        \unitlength\p@\thinlines
        \put(21,0){\line(-1,0){15}}
        \put(0,21){\line(0,-1){15}}
    \end{picture}%
}
\renewcommand*\CROP@@llc{%
    \begin{picture}(0,0)
        \unitlength\p@\thinlines
        \put(-21,0){\line(1,0){15}}
        \put(0,-21){\line(0,1){15}}
    \end{picture}%
}
\renewcommand*\CROP@@lrc{%
    \begin{picture}(0,0)
        \unitlength\p@\thinlines
        \put(21,0){\line(-1,0){15}}
        \put(0,-21){\line(0,1){15}}
    \end{picture}%
}
\crop[cam]%
\fi\fi%\fi

%% Fonts Used
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}


\renewcommand\normalsize{%
   \@setfontsize\normalsize{9bp}{10.5bp}%
   \abovedisplayskip 9\p@ \@plus5\p@ \@minus2.5\p@%
   \abovedisplayshortskip 6\p@ \@plus3\p@ \@minus2\p@%
   \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus2\p@%
   \belowdisplayskip\abovedisplayskip%
   \let\@listi\@listI}%
\normalsize%
\let\@bls\baselineskip%

\renewcommand\small{%
   \@setfontsize\small{8.5bp}{10bp}%
   \abovedisplayskip 5\p@ \@plus3\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus2\p@
   \belowdisplayshortskip 3\p@ \@plus2\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 4\p@ \@plus2\p@ \@minus2\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip}

\renewcommand\footnotesize{%
   \@setfontsize\footnotesize{8bp}{9.5bp}%
   \abovedisplayskip 5\p@ \@plus2\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus\p@
   \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 3\p@ \@plus\p@ \@minus\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip}
%
\renewcommand\scriptsize{\@setfontsize\scriptsize\@ixpt\@ixpt}

%% Layout Settings
\setlength{\paperwidth}{8.5truein}%
\setlength{\paperheight}{11truein}%

% Line spacing
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}

% Paragraph dimensions and inter-para spacing
\setlength\parskip{0\p@}
\setlength\parindent{10\p@}

% Set inter-para skips
\setlength\smallskipamount{3\p@ \@plus 1\p@ \@minus 1\p@}
\setlength\medskipamount{6\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\bigskipamount{12\p@ \@plus 4\p@ \@minus 4\p@}

% Page break penalties
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301

% Disallow widows and orphans
\clubpenalty 10000
\widowpenalty 10000

% Disable page breaks before equations, allow pagebreaks after
% equations and discourage widow lines before equations.
\displaywidowpenalty 10000
\predisplaypenalty   10000
\postdisplaypenalty  0

% Allow breaking the page in the middle of a paragraph
\interlinepenalty 0

% Disallow breaking the page after a hyphenated line
\brokenpenalty 10000

% Hyphenation; don't split words into less than three characters
\lefthyphenmin=3
\righthyphenmin=3

%% Set page layout dimensions
\setlength\oddsidemargin   {36.5pt}
\setlength\evensidemargin  {36.5pt}
\addtolength{\oddsidemargin}{-1in}
\addtolength{\evensidemargin}{-1in}

\setlength\headheight{8\p@}         % height of running head
\setlength\topmargin{28\p@}          % head margin %%Top of Text
\addtolength{\topmargin}{-1in}

\setlength\topskip{9.5\p@}           % height of first line of text
\setlength\headsep{24\p@}           % space below running head --
\addtolength\headsep{-\topskip}     %   base to base with first line of text

\setlength\textwidth{36pc}             % text measure excluding margins
\setlength\textheight{58\baselineskip} % 58 + 1 = 59 lines
\addtolength\textheight{\topskip}      %    including the first
                                       %    line on the page
\newlength\footheight
\setlength\footheight{8.25\p@}            % space above footer line
\setlength\footskip{24.5\p@}            % space above footer line
%\setlength\maxdepth{.2\topskip}     % pages can be short or deep by half a line?

\setlength\maxdepth{2.5pt}%

\setlength\columnsep{15\p@}          % space between columns for double-column text
\setlength\columnseprule{0\p@}      % width of rule between two columns

% Footnotes

\setlength\footnotesep{10\p@}     % space between footnotes
% space between text and footnote
\setlength{\skip\footins}{20\p@ \@plus6\p@ \@minus5\p@}%

% Float placement parameters

% The total number of floats that can be allowed on a page.
\setcounter{totalnumber}{10}
% The maximum number of floats at the top and bottom of a page.
\setcounter{topnumber}{5}
\setcounter{bottomnumber}{5}
% The maximum part of the top or bottom of a text page that can be
% occupied by floats. This is set so that at least four lines of text
% fit on the page.
\renewcommand\topfraction{.921}
\renewcommand\bottomfraction{.921}
% The minimum amount of a text page that must be occupied by text.
% This should accomodate four lines of text.
\renewcommand\textfraction{.079}
% The minimum amount of a float page that must be occupied by floats.
\renewcommand\floatpagefraction{.887}

% The same parameters repeated for double column output
\renewcommand\dbltopfraction{.88}
\renewcommand\dblfloatpagefraction{.88}

% Space between floats
\setlength\floatsep    {12\p@ \@plus 2\p@ \@minus 2\p@}
% Space between floats and text
\setlength\textfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}
% Space above and below an inline figure
\setlength\intextsep   {18\p@ \@plus 2\p@ \@minus 2\p@}

% For double column floats
\setlength\dblfloatsep    {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\dbltextfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}

% Space left at top, bottom and inbetween floats on a float page.
\setlength\@fptop{0\p@}         % no space above float page figures
\setlength\@fpsep{12\p@ \@plus 2fil}
\setlength\@fpbot{0\p@ \@plus 1fil}

% The same for double column
\setlength\@dblfptop{0\p@}
\setlength\@dblfpsep{12\p@ \@plus 1fil}
\setlength\@dblfpbot{0\p@ \@plus 2fil}

\hyphenation{Figure Figures Table Tables Equation Equations Section Sections Appendix Theorem Lemma Dunmore}


%% Labels
\renewcommand\contentsname{Contents}
\renewcommand\listfigurename{List of Figures}
\renewcommand\listtablename{List of Tables}
\renewcommand\refname{References}
\renewcommand\indexname{Index}
\renewcommand\figurename{Figure}
\renewcommand\tablename{Table}
\renewcommand\partname{Part}
\renewcommand\appendixname{Appendix}
\renewcommand\abstractname{Abstract}

%% Article Type
\sodef\articletracking{}{.1em}{.4em plus1em}{.5em plus1em minus1em}
\def\articletype#1{\gdef\@articletype{\articletracking{#1}}\gdef\@articletype{#1}}
\articletype{}

%% Meta Info
\def\@artid{}
\def\@jname{}
\def\@jvol{00}
\def\@jid{}
\def\@jissue{00}
\gdef\@jyear{}
\def\@jmonth{xx} %% Summer, Winter, Fall,
\def\@jpublogo{}
\def\@journallogo{}
\def\@DOI{}
\def\nullvalue{xx}
\gdef\@doinumber{}

\gdef\jname#1{\gdef\@jname{#1}}
\def\artid#1{\gdef\@artid{#1}}
\def\jvol#1{\gdef\@jvol{#1}}
\def\jissue#1{\gdef\@jissue{#1}}
\def\jyear#1{\gdef\@jyear{#1}}
\def\jmonth#1{\gdef\@jmonth{#1}}
\def\jlogo#1{\gdef\@journallogo{#1}}%
\def\jid#1{\gdef\@jid{#1\relax}}
\def\@doi{10.1002/\@jid.\@artid}
\def\doi#1{\gdef\@doi{\lowercase{#1}}}%

%%% Font Definitions for Article opening page
\def\articletypefont{\fontsize{12bp}{24bp}\selectfont}
\def\subtitlefont{\fontfamily{\sfdefault}\fontsize{12bp}{14bp}\selectfont}
\def\titlefont{\fontfamily{\sfdefault}\fontsize{16bp}{18bp}\selectfont\bfseries\raggedright}
\def\aueditorfont{\fontfamily{\sfdefault}\fontsize{9bp}{11bp}\selectfont}
\def\authorfont{\fontfamily{\sfdefault}\fontsize{9bp}{11bp}\selectfont}
\def\affiliationfont{\fontfamily{\sfdefault}\fontsize{8bp}{10bp}\selectfont\itshape}
\def\fundingfont{\normalfont\fontsize{8bp}{10bp}\selectfont}
\def\addressfont{\normalfont\fontsize{8bp}{10bp}\selectfont\itshape}
\def\corresfont{\normalfont\fontsize{8bp}{10bp}\selectfont}
\def\abstractfont{\normalfont\fontsize{8bp}{10bp}\selectfont}%

%% Article "Title & Author" running head
\gdef\@titlemark{}  %% Recto
\gdef\@authormark{} %% Verso
\def\titlemark#1{\gdef\@titlemark{#1}}
\def\authormark#1{\gdef\@authormark{#1}}

\def\rectohead#1{\gdef\@titlemark{#1}}
\def\versohead#1{\gdef\@authormark{#1}}

%% Article Editor(s) & Author(s)
\newcommand{\editorphoto}[1]{\includegraphics{#1}\vskip9pt}
\def\aueditor#1{\gdef\@aueditor{#1\par\addvspace{10pt}}}\gdef\@aueditor{}
%\def\author#1{\gdef\@author{#1}}\gdef\@author{}
\renewcommand{\author}[2][1]{%
\ifnum#1=1\gdef\@author{#2\par\addvspace{3pt}}\else%
    \ifnum#1=2\gdef\@secondauthor{#2\par\addvspace{3pt}}\else%
        \ifnum#1=3\gdef\@thirdauthor{#2\par\addvspace{3pt}}\else%
            \ifnum#1=4\gdef\@fourthauthor{#2\par\addvspace{3pt}}\else%
                \ifnum#1=5\gdef\@fifthauthor{#2\par\addvspace{3pt}}\else%
                    \ifnum#1=6\gdef\@sixthauthor{#2\par\addvspace{3pt}}\else%
                        \ifnum#1=7\gdef\@sevenauthor{#2\par\addvspace{3pt}}\else%
                            \ifnum#1=8\gdef\@eightauthor{#2\par\addvspace{3pt}}\else%
                                \ifnum#1=9\gdef\@ninthauthor{#2\par\addvspace{3pt}}\else%
\fi\fi\fi\fi\fi\fi\fi\fi\fi%
}\gdef\@author{}%
\gdef\@secondauthor{}%
\gdef\@thirdauthor{}%
\gdef\@fourthauthor{}%
\gdef\@fifthauthor{}%
\gdef\@sixthauthor{}%
\gdef\@sevenauthor{}%
\gdef\@eightauthor{}%
\gdef\@ninthauthor{}%

%% Copyright
\def\@abscopyrights{Copyright \textcopyright\ \@jyear\ reserved.}
\def\abscopyrights#1{\gdef\@abscopyrights{#1}}
%\def\@copyrightname{\textbf{Copyright:} reserved.}
\def\copyrightname#1{\gdef\@copyrightname{#1}}
\sodef\jnametracking{}{.05em}{.4em plus1em}{.5em plus1em minus1em}
\def\jname#1{\gdef\@jname{\jnametracking{#1}}}

%% Maketitle updates
\renewcommand{\title}[2][]{\gdef\@shorttitle{#1}\ifx\@shorttitle\empty\gdef\@title{#2}\titlemark{#2}\else\gdef\@title{#2}\titlemark{#1}\fi}
\def\subtitle#1{\gdef\@subtitle{{#1\strut\vskip3.5pt}}}\gdef\@subtitle{}%
%\def\affiliation#1{\gdef\@affiliation{{#1}}}\gdef\@affiliation{}%
\newcommand{\affiliation}[2][1]{%
\ifnum#1=1\gdef\@affiliation{#2\par\addvspace{12pt}}\else%
    \ifnum#1=2\gdef\@secondaffiliation{#2\par\addvspace{12pt}}\else%
        \ifnum#1=3\gdef\@thirdaffiliation{#2\par\addvspace{12pt}}\else%
            \ifnum#1=4\gdef\@fourthaffiliation{#2\par\addvspace{12pt}}\else%
               \ifnum#1=5\gdef\@fifthaffiliation{#2\par\addvspace{12pt}}\else%
                    \ifnum#1=6\gdef\@sixthaffiliation{#2\par\addvspace{12pt}}\else%
                        \ifnum#1=7\gdef\@seventhaffiliation{#2\par\addvspace{3pt}}\else%
                            \ifnum#1=8\gdef\@eightaffiliation{#2\par\addvspace{3pt}}\else%
                                \ifnum#1=9\gdef\@ninthaffiliation{#2\par\addvspace{3pt}}\else%
\fi\fi\fi\fi\fi\fi\fi\fi\fi%
}\gdef\@affiliation{}%
\gdef\@secondaffiliation{}%
\gdef\@thirdaffiliation{}%
\gdef\@fourthaffiliation{}%
\gdef\@fifthaffiliation{}%
\gdef\@sixthaffiliation{}%
\gdef\@seventhaffiliation{}%
\gdef\@eightaffiliation{}%
\gdef\@ninthaffiliation{}%

%% Funding
\def\funding#1{\gdef\@funding{{#1}}}\gdef\@funding{}%

%% Abstract updates
\newif\ifabstract\global\abstractfalse
\newbox\abstractbox
\gdef\@abstract{}
\long\def\abstract#1{\global\abstracttrue%
\gdef\@abstract{\abstractfont{\fontfamily{\sfdefault}\selectfont\textbf{Abstract:}}\enskip#1\space\@abscopyrights\strut\par}}

\long\def\altabstract#1{\gdef\@altabstract{{\abstractfont{\fontfamily{\sfdefault}\selectfont\textbf{摘要:}}\enskip#1\strut\par}}}\gdef\@altabstract{}%

\newcommand{\abstractfigure}[3]{%
\vskip2pt\par%
\noindent{\normalfont\fontsize{8bp}{10bp}\selectfont\bfseries#2}\vspace*{4pt}\par%
\centerline{#1}\vspace*{4pt}\par%
\noindent{\normalfont\fontsize{8bp}{10bp}\selectfont#3\vskip-12pt\par}}

%% Maketitle print abstract
\gdef\printabstract{%
    \ifx\@abstract\empty\else\@abstract\fi%
    \ifx\@altabstract\empty\else\vskip8pt\@altabstract\fi%
\par\addvspace{10pt}}

%% Keywords
\gdef\@keywords{}
\def\keywordname{Key\,\,words:}
\def\kerwordsep{\enskip}
\newcommand{\keywords}[2][\keywordname]{\gdef\@keywords{\par\addvspace{10\p@}\noindent{\raggedright\normalfont\fontsize{9bp}{11bp}\selectfont\textbf{#1}\kerwordsep#2}}}

%% Jelcodes codes
\gdef\@jelcodes{}
\def\jelcodes#1{\gdef\@jelcodes{\par\addvspace{4\p@}\parindent=15pt{\fontsize{8bp}{10bp}\selectfont \textbf{MSC codes. }#1\par}}}

%% Abbreviations codes
\gdef\@abbreviations{}
\def\abbreviations#1{\gdef\@abbreviations{\par\addvspace{10\p@}\noindent\textbf{Abbreiviations:}\enskip{\raggedright\normalfont\fontsize{9bp}{11bp}\selectfont#1}}}

%% Article History
\def\received#1{\gdef\@received{Received #1}}\gdef\@received{}%
\def\revised#1{\gdef\@revised{Revised #1}}\gdef\@revised{}%
\def\accepted#1{\gdef\@accepted{Accepted #1}}\gdef\@accepted{}%
\def\published#1{\gdef\@published{#1}}\gdef\@published{}%

%% Corresponding and Collaborators text
%\def\corresp#1{\gdef\@corresp{\footnotetext{\noindent\fontsize{9bp}{10bp}\selectfont#1}}}\gdef\@corresp{}%
\def\collaborators#1{\gdef\@collaborators{\footnotetext{\noindent\fontsize{9bp}{10bp}\selectfont#1}}}\gdef\@collaborators{}%

\long\def\corresp#1{\gdef\@corresp{\footnotetext{\noindent\fontsize{8bp}{10bp}\selectfont#1}}}\gdef\@corresp{}%

\def\authornote#1{\noindent\null\hfill{\underline{\fontsize{13bp}{13bp}\selectfont #1}}\vspace*{6pt}\hfill\null}


%% Article Header Definition
\renewcommand{\@maketitle}
{\noindent{{%
    %\hsize.95\textwidth
    \parindent0pt%
    \vskip21.5pt\par%
%    \null\hfill{\articletypefont\@articletype\strut\par}
    \null\vskip46pt\par%
    \ifx\@subtitle\empty\vspace*{30pt}\else{\subtitlefont\@subtitle\addvspace{6pt}}\fi%
    %% Aritle Title
    \ifx\@title\empty\else%
        {\titlefont\@title\strut\par}
        \addcontentsline{toc}{chapter}{\@title}% for bookmarks
    \fi%
    %% Aritle Authors, Address and Correspondings
  }}
}

%% Maketitle settings
\renewcommand\maketitle{\par
%%
\global\@appendixfalse%\def\appendix#1{\relax}%
\setcounter{section}{0}%
\setcounter{equation}{0}%
\setcounter{figure}{0}%
\setcounter{table}{0}%
\def\thesection{\arabic{section}}
\def\thefigure{\arabic{figure}}
\def\thetable{\arabic{table}}
\def\theequation{\arabic{equation}}
\setcounter{footnote}{0}%
%\setcounter{endnote}{0}%
\newcounter{querynote}%
\setcounter{querynote}{0}%
\newcounter{MSquerynotedisplay}%
\setcounter{MSquerynotedisplay}{0}%
%%
  \begingroup%
   \thispagestyle{titlepage}%
    \renewcommand\thefootnote{}%{\@fnsymbol\c@footnote}%
    \gdef\@makefnmark{}%\rlap{\@textsuperscript{\normalfont\smash{\@thefnmark}}}}%
    \long\def\@makefntext##1{\parindent 0em\noindent\small\selectfont
            %\hbox{\@textsuperscript{\normalfont\@thefnmark}}
            ##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne%
        \twocolumn[\@maketitle]%
      \else
        \twocolumn[\@maketitle]%
      \fi%
    \else%
      \newpage%
      \global\@topnum\z@% Prevents figures from going at top of page.
      \@maketitle%
\par\addvspace{12pt}
  \noindent{\aueditorfont\@aueditor}%%
\removelastskip\begin{center}
  \leftskip2em  plus1fill
  \rightskip2em  plus1fill
  \authorfont\@author%%
  \affiliationfont\@affiliation%%
  \authorfont\@secondauthor%%
  \affiliationfont\@secondaffiliation%%
  \authorfont\@thirdauthor%%
  \affiliationfont\@thirdaffiliation%%
  \authorfont\@fourthauthor%%
  \affiliationfont\@fourthaffiliation%%
  \authorfont\@fifthauthor%%
  \affiliationfont\@fifthaffiliation%%
  \authorfont\@sixthauthor%%
  \affiliationfont\@sixthaffiliation%%
  \authorfont\@sevenauthor%%
  \affiliationfont\@seventhaffiliation%%
  \authorfont\@eightauthor%%
  \affiliationfont\@eightaffiliation%%
  \authorfont\@ninthauthor%%
  \affiliationfont\@ninthaffiliation%%
\end{center}
 \ifx\@corresp\empty\else\@corresp\fi
 \ifx\@collaborators\empty\else\@collaborators\fi %% To check
%  \noindent\auaddress\par\addvspace{3pt}                        %%      For Multiple author and affiliations
  \noindent\ifx\@funding\empty\else{\fundingfont\@funding}\fi\par    %%      Funding adress
  \noindent\printabstract\par
      \fi%
{\normalfont\fontsize{9bp}{11bp}\selectfont\par\addvspace{0pt}%
         \ifx\@received\empty\else\@received\space\fi%
         \ifx\@revised\empty\else\@revised\space\fi%
         \ifx\@accepted\empty\else\@accepted\space\fi%
         \ifx\@published\empty\else\@published\fi%
\par\addvspace{6pt}}
\ifx\@keywords\empty\else{\@keywords}\vskip5pt\fi%
\ifx\@jelcodes\empty\else{\@jelcodes}\vskip5pt\fi%
\ifx\@abbreviations\empty\else{\@abbreviations}\vskip5pt\fi%
  \vskip20pt\endgroup%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax%
%%  \global\let\maketitle\relax%
%%  \global\let\@maketitle\relax%
  %\global\let\@thanks\@empty%
  \global\let\@author\@empty%
  \global\let\@date\@empty%
  %\global\let\@title\@empty%
%%
  \global\let\@articletype\relax%
  \global\let\@title\relax%
  \global\let\@subtitle\relax%
  \global\let\@author\relax%
  \global\let\@secondauthor\relax%
  \global\let\@thirdauthor\relax%
  \global\let\@fourthauthor\relax%
  \global\let\@fifthauthor\relax%
  \global\let\@sixthauthor\relax%
  \global\let\@sevenauthor\relax%
  \global\let\@eightauthor\relax%
  \global\let\@ninthauthor\relax%
  \global\let\@affiliation\relax%
  \global\let\@secondaffiliation\relax%
  \global\let\@thirdaffiliation\relax%
  \global\let\@fourthaffiliation\relax%
  \global\let\@fifthaffiliation\relax%
  \global\let\@sixthaffiliation\relax%
  \global\let\@seventhaffiliation\relax%
  \global\let\@eightaffiliation\relax%
  \global\let\@ninthaffiliation\relax%
  \global\let\@aueditor\relax%
  \global\let\@received\relax%
  \global\let\@received\relax%
  \global\let\@revised\relax%
  \global\let\@accepted\relax%
  \global\let\@collaborators\relax%
  \global\let\@abstract\relax%
  \global\let\@\@abscopyrights\relax%
  \global\let\@altabstract\relax%
%  \global\let\@abstractfigure\relax%
  \global\let\@keywords\relax%
  \global\let\@jelcodes\relax%
  \global\let\@corresp\relax%
  \global\let\@funding\relax%
  \global\let\@abbreviations\relax%
%  \global\let\@copyrightname\relax%
%%
  \global\let\date\relax%
  \global\let\and\relax
  \@afterheading
  \def\@makefnmark{\hbox{\@textsuperscript{\normalfont\@thefnmark}}}
\vskip6pt plus 5pt minus 5pt}%

%% Running heads
%% Opening/Title Page Styles
\def\ps@titlepage{%
     \def\@oddhead{\hbox to \textwidth{%
      \vbox to 0pt{%
      \ifarticleinfo%
          \fontsize{8}{8}\selectfont\addvspace{-5.5pt}%
           \parbox{\textwidth}{\textit{\@jname} \textbf{\@jvol}(\@jissue): \MSFirstPage--\MSLastPage\ (\@jyear)\\[4pt]%
                %                \if@ProofPDF\ ({\@jyear})\else\ \textbf{\@jvol}(\@jissue): 00--00 %\pageref{pagesLTS.0}--\lastpageref{VeryLastPage}\
                %                (\@jyear)\fi\\[4\p@]
           Published online in Journals Library\\[4\p@]
           {\fontsize{9bp}{9bp}\selectfont (onlinelibrary.com). DOI: \@doi\hfill {\bfseries\@articletype}}}
       \else\relax\fi}%
      %
      }}%
     \let\@evenhead\@oddhead%
     \def\@oddfoot{\vbox to 6\p@{\@copyrightname\hfill}}
     \let\@evenfoot\@oddfoot}%

\def\ps@headings{%
      \def\@oddhead{\null\hfill{\fontsize{8bp}{8bp}\selectfont\@titlemark}\hfill\null\llap{\fontsize{8bp}{8bp}\selectfont\thepage}}%
      \def\@evenhead{\rlap{\fontsize{8bp}{8bp}\selectfont\thepage}\null\hfill{\fontsize{8bp}{8bp}\selectfont\@authormark}\hfill\null}%
      \let\@mkboth\markboth%
      \def\@oddfoot{\parbox{\textwidth}{\fontsize{8bp}{8bp}\selectfont \@copyrightname\hfill
      \textit{\@jname} \textbf{\@jvol}(\@jissue): \MSFirstPage--\MSLastPage\ (\@jyear)\\[1pt]
      \null\hfill DOI: 10.1002/\@jid}}
      \let\@evenfoot\@oddfoot
      }
\pagestyle{headings}
%% End Running heads

%% Sections
\setcounter{secnumdepth}{2}
\renewcommand\thesection      {\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph\@arabic\c@subparagraph}

\def\sectionfont{\fontfamily{\sfdefault}\fontsize{10bp}{12bp}\selectfont\bfseries}
\def\subsectionfont{\fontfamily{\sfdefault}\fontsize{10bp}{12bp}\selectfont\bfseries}
\def\subsubsectionfont{\fontfamily{\sfdefault}\normalfont\bfseries\itshape}
\def\paragraphfont{\normalfont\bfseries}
\def\subparagraphfont{\normalfont\bfseries\itshape}

\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-18pt \@plus 0ex \@minus 0ex}%
                                   {10pt}%
                                   {\sectionfont}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-12pt \@plus 0ex \@minus 0ex}%
                                     {6pt}%
                                     {\subsectionfont}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-12pt \@plus 0ex \@minus 0ex}%
                                     {0.01pt}%
                                     {\subsubsectionfont}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-.5em}%
                                    {\paragraphfont}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\z@}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                     {\subparagraphfont}}

%% Lists
\newdimen\labelwidthi
\newdimen\labelwidthii
\newdimen\labelwidthiii
\newdimen\labelwidthiv
\def\normal@labelsep{0.5em}
\labelsep\normal@labelsep
\settowidth{\labelwidthi}{(iii)}
\settowidth{\labelwidthii}{(d)}
\settowidth{\labelwidthiii}{(iii)}
\settowidth{\labelwidthiv}{(M)}
\leftmargini\labelwidthi    \advance\leftmargini\labelsep
\leftmarginii\labelwidthii  \advance\leftmarginii\labelsep
\leftmarginiii\labelwidthiii \advance\leftmarginiii\labelsep
\leftmarginiv\labelwidthiv  \advance\leftmarginiv\labelsep
\def\setleftmargin#1#2{\settowidth{\@tempdima}{#2}\labelsep\normal@labelsep
  \csname labelwidth#1\endcsname\@tempdima
  \@tempdimb\@tempdima \advance\@tempdimb\labelsep
  \csname leftmargin#1\endcsname\@tempdimb}
\def\@listI{\leftmargin\leftmargini
  \labelwidth\labelwidthi \labelsep\normal@labelsep
  \topsep \z@ \partopsep\z@ \parsep\z@ \itemsep\z@
  \listparindent 1em}
\def\@listii{\leftmargin\leftmarginii
  \labelwidth\labelwidthii \labelsep\normal@labelsep
  \topsep\z@ \partopsep\z@ \parsep\z@ \itemsep\z@
  \listparindent 1em}
\def\@listiii{\leftmargin\leftmarginiii
  \labelwidth\labelwidthiii \labelsep\normal@labelsep
  \topsep\z@ \partopsep\z@ \parsep\z@ \itemsep\z@
  \listparindent 1em}
\def\@listiv{\leftmargin\leftmarginiv
  \labelwidth\labelwidthiv \labelsep\normal@labelsep
  \topsep\z@ \partopsep\z@ \parsep\z@ \itemsep\z@
  \listparindent 1em}
\let\@listi\@listI
\@listi
%
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\def\labelitemi{$\bullet$}          \def\labelitemii{$\cdot$}
\def\labelenumi{\theenumi.}        \def\theenumi{\arabic{enumi}}
\def\labelenumii{(\alph{enumii})}   \def\theenumii{\theenumi\alph{enumii}}
\def\labelenumiii{(\roman{enumiii})}\def\theenumiii{\theenumii.\roman{enumiii}}
\def\labelenumiv{(\Alph{enumiv})}   \def\theenumiv{\theenumiii.\Alph{enumiv}}

%% Numbered Lists (Arabic/Alpha, right align)
\def\enumargs{%
   \leftmargini \parindent%
   \topsep 6pt%
   \partopsep     \z@%
   \itemsep       \z@%
   \parsep        \z@%
   \labelsep      5.75pt%
   \rightmargin   \z@%
   \listparindent \parindent%
   \itemindent    \z@}%
\def\enumerate{%
    \@ifnextchar[{\@numerate}{\@numerate[0.]}}
\def\@numerate[#1]{\par%
     \ifnum \@enumdepth >3 \@toodeep\else
     \advance\@enumdepth \@ne
     \edef\@enumctr{enum\romannumeral\the\@enumdepth}
     \list{\csname label\@enumctr\endcsname}{%
       \enumargs%
       \setlength{\leftmargin}{\csname leftmargin\romannumeral\the\@enumdepth\endcsname}
       \usecounter{\@enumctr}
       \settowidth\labelwidth{#1}
       \leftmargin0pt
       \addtolength{\leftmargin}{\labelwidth}
       \addtolength{\leftmargin}{\labelsep}
       \def\makelabel##1{\hss\llap{##1}}}%
     \fi
   }
\let\endenumerate\endlist

%% Unnumbered lists
\def\unenumargs{%
   \leftmargini \parindent%
   \topsep6pt%
   \partopsep     \z@%
   \itemsep       \z@%
   \parsep        \z@%
   \labelsep      0\p@%
   \rightmargin   \z@%
   \raggedright%
   \listparindent \parindent%
   \itemindent    -10pt}%
\def\unenumerate{%
    \@ifnextchar[{\@unenumerate}{\@unenumerate[0.]}}
\def\@unenumerate[#1]{\par%
     \ifnum \@enumdepth >3 \@toodeep\else
     \advance\@enumdepth \@ne
     \edef\@enumctr{enum\romannumeral\the\@enumdepth}
     \list{\csname label\@enumctr\endcsname}{%
       \unenumargs
       \setlength{\leftmargin}{\csname leftmargin\romannumeral\the\@enumdepth\endcsname}
       \usecounter{\@enumctr}
       \settowidth\labelwidth{#1}
       \addtolength{\leftmargin}{\labelwidth}
       \addtolength{\leftmargin}{\labelsep}
       \def\makelabel##1{\hss\llap{##1}}}%
     \fi
   }
\let\endunenumerate\endlist%

%% Roman Lists (roman/alpha letters, towards left align)
\def\romanenumargs{%
   \leftmargini \parindent%
   \topsep 6pt%
   \partopsep     \z@%
   \itemsep       \z@%
   \parsep        \z@%
   \labelsep      .5em%
   \rightmargin   \z@%
   \listparindent \parindent%
   \itemindent    \z@}%
\def\romanlist{%
    \@ifnextchar[{\@romannumerate}{\@romannumerate[0.]}}
\def\@romannumerate[#1]{\par%
     \ifnum \@enumdepth >3 \@toodeep\else
     \advance\@enumdepth \@ne
     \edef\@enumctr{enum\romannumeral\the\@enumdepth}
     \list{\csname label\@enumctr\endcsname}{%
       \enumargs%
       \setlength{\leftmargin}{\csname leftmargin\romannumeral\the\@enumdepth\endcsname}
       \usecounter{\@enumctr}
       \settowidth\labelwidth{#1}
       \leftmargin0pt
       \addtolength{\leftmargin}{\labelwidth}
       \addtolength{\leftmargin}{\labelsep}
       \def\makelabel##1{{##1}}}%
     \fi}
\let\endromanlist\endlist
%%

\def\verse{\let\\=\@centercr
  \list{}{\itemsep\z@
  \topsep6pt
  \itemindent \z@
  \listparindent\z@
  \rightmargin 1em
  \leftmargin \rightmargin\itshape}\item[]}
\let\endverse\endlist

\def\quotation{\list{}{\vskip 8pt\itemindent\z@
 \leftmargin 1em \rightmargin \z@
  \parsep \z@ \@plus 1pt}\item[]}
\let\endquotation\endlist

\def\quote{\list{}{\itemindent\z@
   \leftmargin 1em \rightmargin \z@}%
\item[]}
\let\endquote\endlist

\def\descriptionlabel#1{\hspace\labelsep \itshape #1}
\def\description{\list{}{\labelwidth\z@
  \leftmargin \z@ \topsep6pt\itemindent \z@ %-\leftmargin
  \let\makelabel\descriptionlabel}}
\let\enddescription\endlist

\def\hypertargetid#1#2{}{}

%% Floats
\renewenvironment{figure}
               {\let\marginpar\@gobble\@float{figure}}
               {\end@float}
\renewenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
\renewenvironment{table}
               {\@float{table}}
               {\end@float}
\renewenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
\newenvironment{spantable*} %% Span accross double column, with 2/3 column
               {\@dblfloat{table}}
               {\end@dblfloat}

\newcounter{scheme}
\renewcommand\thescheme{\@arabic\c@scheme}
\def\fps@scheme{tbp}
\def\ftype@scheme{1}
\def\fnum@scheme{Scheme\nobreakspace\thescheme}
\def\ext@scheme{}
\newenvironment{scheme}
               {\let\marginpar\@gobble\@float{scheme}}
               {\end@float}

\newcounter{diagram}
\renewcommand \thediagram {\@arabic\c@diagram}
\def\fps@diagram{tbp}
\def\ftype@diagram{1}
\def\ext@diagram{lof}
\def\diagramname{Diagram}
\def\fnum@diagram{\diagramname\nobreakspace\thediagram}
\newenvironment{diagram}
               {\let\@makecaption\@diagramcaption\@float{diagram}}
               {\end@float}
\newenvironment{diagram*}
               {\let\@makecaption\@diagramcaption\@dblfloat{diagram}}
               {\end@dblfloat}

%% Diagram Font-sizes
\def\diagramlabelfont{\fontfamily{\sfdefault}\fontsize{9bp}{10.5bp}\selectfont\bfseries}
\def\diagramcaptionfont{\normalfont\fontsize{9bp}{10.5bp}\selectfont}
\def\diagramlabelspace{:\enspace}
\long\def\@diagramcaption#1#2{%
{\setbox\captionbox\hbox{\renewcommand{\query}[2][]{}#2}%
 \setbox\figcaptionbox\vbox{\renewcommand{\query}[2][]{}{\diagramlabelfont#1\diagramlabelspace}\diagramcaptionfont#2\strut\par}
 {{\diagramlabelfont#1\diagramlabelspace}\diagramcaptionfont#2\strut\par}}}

\setlength\abovecaptionskip{15.2\p@}
\setlength\belowcaptionskip{1.25\p@}
\newlength\tablebelowcaptionskip
\newlength\tableabovefootnoteskip
\setlength\tablebelowcaptionskip{1\p@}
\setlength\tableabovefootnoteskip{2\p@}

\setlength\arraycolsep{2\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\def\thetable{\arabic{table}}
\def\fnum@figure{\figurename\space\thefigure}
\def\fnum@table{\tablename\space\thetable}

%% Figure Font-sizes
\def\figurelabelfont{\fontfamily{\sfdefault}\fontsize{9bp}{10.5bp}\selectfont\bfseries}
\def\figurecaptionfont{\normalfont\fontsize{9bp}{10.5bp}\selectfont}
\def\figurelabelspace{\enspace}
\def\figurecontinuedstyle{\normalfont}
\def\figuretopcontinuedstyle{\normalfont}
\def\figurebottomcontinuedstyle{\normalfont}

%% Table point sizes
\def\tablelabelfont{\fontfamily{\sfdefault}\fontsize{9bp}{10.5bp}\selectfont\bfseries}
\def\tablecaptionfont{\normalfont\fontsize{9bp}{10.5bp}\selectfont}
\def\tablecolheadfont{\fontsize{8bp}{9.5bp}\selectfont}
\def\tablesubcolheadfont{\fontsize{8bp}{9.5bp}\selectfont}
\def\tablebodyfont{\fontsize{8bp}{9.5bp}\selectfont}
\def\tablefootnotefont{\fontsize{8bp}{9.5bp}\selectfont}
\def\tabindent{\hspace*{11pt}}
\def\tablecontinuedstyle{\normalfont}
\def\tabletopcontinuedstyle{\fontsize{11bp}{11bp}\selectfont}
\def\tablebottomcontinuedstyle{\fontsize{11bp}{11bp}\selectfont}
\def\tablelabelspace{\enspace}

\def\FigName{figure}
\long\def\@makecaption#1#2{%
    \ifx\FigName\@captype
      \vskip\abovecaptionskip
        \@figurecaption{#1}{#2}
    \else
        \@tablecaption{#1}{#2}
      \vskip\belowcaptionskip
    \fi%
}

%% Figures caption
\newbox\figcaptionbox
\newbox\captionbox
\long\def\@figurecaption#1#2{%
{\setbox\captionbox\hbox{\renewcommand{\query}[2][]{}#2}%
 \setbox\figcaptionbox\vbox{\renewcommand{\query}[2][]{}{\figurelabelfont#1\figurelabelspace}\figurecaptionfont#2\strut\par}
 {{\figurelabelfont#1\figurelabelspace}\figurecaptionfont#2\strut\par}}}
\def\figsource#1{\fontsize{8bp}{9bp}\selectfont#1\par}
\def\LT@makecaption#1#2#3{%
  \LT@mcol\LT@cols c{\hbox to\z@{\hss\parbox[t]\LTcapwidth{%
    \sbox\@tempboxa{{\figurelabelfont#1{#2\figurelabelspace}}\figurecaptionfont#3}%
    \ifdim\wd\@tempboxa>\hsize
      {\figurelabelfont#1{#2\figurelabelspace}}\figurecaptionfont#3%
    \else
      \hbox to\hsize{\box\@tempboxa\hfil}%
    \fi
    \endgraf\vskip\baselineskip}%
  \hss}}}
%% Table Caption
\long\def\@tablecaption#1#2{{{\tablelabelfont#1\tablelabelspace}\tablecaptionfont#2\strut\par}}

\newcommand{\processfigure}[3]{\centerline{#1}\vspace*{-10pt}\par\caption{#2}\if!#3!\relax\else\par\figsource{#3}\fi}
\newcommand{\unnumberedfigure}[3]{\centerline{#1}\par{#2}\par{#3}}
\newcommand{\processscheme}[3]{\centerline{#1}\par\caption{#2}\if!#3!\relax\else\par\figsource{#3}\fi}
\newcommand{\unnumberedscheme}[3]{\centerline{#1}\par{#2}\par{#3}}

%% Color Figure Information
\if@PrintPDF
\let\coloronline\relax
\else
\newcommand\coloronline{
    \ifthenelse{\isodd{\thepage}}
    {\vbox{\hspace*{-\textwidth}\hspace*{-3pc}{\begin{turn}{90}{\fontsize{10bp}{10bp}\selectfont \ Color in Online; Gray in Print\ }\end{turn}}\vspace{-11pc}}}
    {\vbox{\hspace*{\textwidth}\hspace*{1pc}{\begin{turn}{270}{\fontsize{10bp}{10bp}\selectfont \ Color in Online; Gray in Print\ }\end{turn}}\vspace{-11pc}}}
}
\fi
%% End floats

%% Table rules
\definecolor{colhdcolor}{cmyk}{0.7,0.55,0.5,0}
\definecolor{rowcolor}{cmyk}{0.11,0.08,0.07,0}
\definecolor{tblboxcolor}{cmyk}{0.18,0.14,0.13,0}
\def\cellcolor{}


%% Top rule
\def\toprule{\noalign{\vskip2.75pt}
\noalign{\ifnum0=`}\fi
  \hrule \@height -3\p@ \@width 0pt
  \hrule \@height .5\p@ % <- rule height
  \hrule \@height 2.75pt \@width 0pt
  \futurelet\@tempa\@xhline}
%% Middle rule
\def\midrule{\noalign{\ifnum0=`}\fi%
  \hrule \@height 0.5pt \@width 0pt
  \hrule \@height .5pt % <- rule height
  \hrule \@height 1pt \@width 0pt
  \futurelet \@tempa\@xhline\noalign{\vskip3pt}}
%% Bottom rule
\def\botrule{\noalign{\ifnum0=`}\fi
  \hrule \@height 0.5pt \@width 0pt
  \hrule \@height .5\p@ % <- rule height
  \futurelet\@tempa\@xhline}
%% Straddle rules
\def\@@@cmidrule[#1-#2]#3#4{\global\@cmidla#1\relax
    \global\advance\@cmidla\m@ne
    \ifnum\@cmidla>0\global\let\@gtempa\@cmidrulea\else
    \global\let\@gtempa\@cmidruleb\fi
    \global\@cmidlb#2\par\vspace*{-0.5pt}\relax
    \global\advance\@cmidlb-\@cmidla
    \global\@thisrulewidth=#3
    \@setrulekerning{#4}
    \ifnum\@lastruleclass=\z@\vskip 0.5\p@\fi
    \ifnum0=`{\fi}\@gtempa
    \noalign{\ifnum0=`}\fi\futurenonspacelet\@tempa\@xcmidrule}
\def\@xcmidrule{%
   \ifx\@tempa\cmidrule
       \vskip-\@thisrulewidth
       \global\@lastruleclass=\@ne
   \else \ifx\@tempa\morecmidrules
       \vskip \cmidrulesep
       \global\@lastruleclass=\@ne\else
       \vskip 0.5\p@
       \global\@lastruleclass=\z@
   \fi\fi
   \ifnum0=`{\fi}}
\let\cline\cmidrule
\newcommand{\colhead}[1]{{\tablecolheadfont#1}}
\newcommand{\subcolhead}[1]{{\tablesubcolheadfont{\vrule depth0pt height1.1em width0pt}#1{\vrule depth.3em height0pt width0pt}}}
\newcommand{\tablenumstyle}{\bfseries}
\newcommand{\tabletextstyle}{\bfseries}
\newcommand{\tablenotesize}{\bfseries}

\def\tstrut{}
\def\bstrut{}

%% Table processtable
\newdimen\tempdime
\newbox\temptbox
\newenvironment{processtable}[3]{{\setbox\temptbox=\hbox{{\renewcommand{\query}[2][]{}\tablebodyfont#2}}%
\tempdime\wd\temptbox\@processtable{#1}{#2}{#3}{\tempdime}}}{\relax}
\newdimen\tabruledimen%
 %%
\newenvironment{@processtable}[4]{%
{%
\begin{minipage}{\tempdime}
\caption{#1}
\end{minipage}\par\addvspace{6\p@}
\vskip\tablebelowcaptionskip{\tablebodyfont%
{\vspace*{-.5pc}#2%
\vskip\tableabovefootnoteskip%
\noindent%
}%
{\tablefootnotefont\selectfont\begin{minipage}{\tempdime}
#3\strut\end{minipage}%
\par\if!#3!\vskip-12\p@\fi}}%
}%
\box4}%
{\relax}%

%% Unnumbered table
\newcommand\unnumberedtable[3]{{\setbox\temptbox=\hbox{{\renewcommand{\query}[2][]{}\tablebodyfont#2}}%
\tempdime\wd\temptbox\@unnumberedtable{#1}{#2}{#3}{\tempdime}}}
%%
\newenvironment{@unnumberedtable}[4]{%
{%
\begin{minipage}{\tempdime}
%\caption
{\if!#1!\vskip-14\p@\else\tablecaptionfont#1\strut\fi}
\end{minipage}\par\addvspace{6\p@}
\vskip\tablebelowcaptionskip{\fontsize{9}{12}\selectfont%
{\vspace*{-.5pc}#2%
\vskip\tableabovefootnoteskip%
\noindent%
}%
{\fontsize{8bp}{10bp}\selectfont\begin{minipage}{\tempdime}
#3\strut\end{minipage}%
\par\if!#3!\vskip-12\p@\fi}}%
}%
\box4}%
{\relax}%

%% Table footnotes
\newenvironment{tablenotes}{}{}

%% TOC styles
\renewcommand\@pnumwidth{1.55em}
\renewcommand\@tocrmarg{2.55em}
\renewcommand\@dotsep{4.5}
\setcounter{tocdepth}{3}
\renewcommand\tableofcontents{%
    \section*{\contentsname
        \@mkboth{\contentsname}{\contentsname}}%
    \@starttoc{toc}%
    }
\renewcommand*\l@section[2]{%
  \ifnum \c@tocdepth >\z@
    \addpenalty\@secpenalty
    \addvspace{1.0em \@plus\p@}%
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
    \endgroup
  \fi}
\renewcommand*\l@subsection{\@dottedtocline{2}{1.5em}{2.3em}}
\renewcommand*\l@subsubsection{\@dottedtocline{3}{3.8em}{3.2em}}
\renewcommand*\l@paragraph{\@dottedtocline{4}{7.0em}{4.1em}}
\renewcommand*\l@subparagraph{\@dottedtocline{5}{10em}{5em}}
\renewcommand\listoffigures{%
    \section*{\listfigurename
      \@mkboth{\listfigurename}{\listfigurename}}%
    \@starttoc{lof}%
    }
\renewcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\renewcommand\listoftables{%
    \section*{\listtablename
      \@mkboth{\listtablename}{\listtablename}}%
    \@starttoc{lot}%
    }
\let\l@table\l@figure
%% End TOC

%% List Environments
\newenvironment{epigraph}
               {\list{}{\topsep=10pt\parskip=0pt\parsep=0pt\leftmargin=1.3pc\rightmargin=0pc}%
                \item\relax}
               {\endlist}
\def\source#1{\ \null\/\\* \null\hfill{\itshape #1}}

\renewenvironment{quote}
               {\list{}{\topsep=12pt\parskip=0pt\parsep=0pt\leftmargin=2pc\rightmargin=2pc}%
                \item\relax}
               {\endlist}

\newenvironment{extract}
               {\list{}{\topsep=12pt\parskip=0pt\parsep=0pt}%
                \item\relax\leftskip-8pt}
               {\endlist}

\def\eenumargs{%
   \leftmargini\parindent%
   \topsep 5pt%
   \partopsep     \z@%
   \itemsep       \z@%
   \parsep        \z@%
   \labelsep      5.5pt%
   \rightmargin   \z@%
   \listparindent \parindent%
   \itemindent    \z@}%

\def\description{%
    \@ifnextchar[{\@nnumerate}{\@nnumerate[0.]}}

\def\@nnumerate[#1]{\par%
     \ifnum \@enumdepth >3 \@toodeep\else
     \advance\@enumdepth \@ne
     \edef\@enumctr{enum\romannumeral\the\@enumdepth}
     \list{\csname label\@enumctr\endcsname}{%
       \eenumargs%
       \setlength{\leftmargin}{\csname leftmargin\romannumeral\the\@enumdepth\endcsname}
       \usecounter{\@enumctr}
       \settowidth\labelwidth{#1}
       \addtolength{\leftmargin}{\labelwidth}
       \addtolength{\leftmargin}{\labelsep}
       \def\makelabel##1{\hss\llap{##1}}}%
     \fi
   }
\let\enddescription\endlist
%% End lists

\def\@hangfrom#1{\setbox\@tempboxa\hbox{{#1}}%
      \hangindent \wd\@tempboxa\noindent\box\@tempboxa}

%% Footnotes
\renewcommand\footnoterule{%
  %\kern2\p@%
  \hrule \@width0.5in}%

\def\thefootnote{\arabic{footnote}}
%\def\@makefnmark{\hbox{\@textsuperscript{\normalfont\@thefnmark}}}
\newcommand{\orchid}[2][]{%
    \if@PapPDF\href{#1}{\includegraphics[width=8pt]{./Styles/orchidlogo.pdf}}\else\if@WebPDF\href{#1}{\includegraphics[width=8pt]{./Styles/orchidlogo.pdf}}\fi\fi%
    \textsuperscript{#2}} %% #1 to Provide

\renewcommand\@makefntext[1]{{%
    %\fontsize{9bp}{9bp}\selectfont
    \@hangfrom{\smash{\@makefnmark}}#1\par}}

%% Rotating floats
\newdimen\rotdimen
\def\rotstart#1{\special{ps: gsave currentpoint currentpoint translate
    #1 neg exch neg exch translate}}
\def\rotfinish{\special{ps: currentpoint grestore moveto}}
\def\rotl#1{\rotdimen=\ht#1\advance\rotdimen by \dp#1
    \hbox to \rotdimen{\vbox to\wd#1{\vskip \wd#1
    \rotstart{270 rotate}\box #1\vss}\hss}\rotfinish}
\def\rotr#1{\rotdimen=\ht #1\advance\rotdimen by \dp#1
    \hbox to \rotdimen{\vbox to \wd#1{\vskip \wd#1
    \rotstart{90 rotate}\box #1\vss}\hss}\rotfinish}
\renewenvironment{sidewaystable*}
               {\@rotdblfloat{table}}
               {\thisfloatpagestyle{plain}\end@rotdblfloat}
\renewenvironment{sidewaysfigure*}
               {\@rotdblfloat{figure}}
               {\thisfloatpagestyle{plain}\end@rotdblfloat}

%% Manuscript settings
\pagestyle{headings}
\sloppy
\frenchspacing
\flushbottom
\adjdemerits=100
\linepenalty=100

%% Inline artwork
\newcommand{\inlineartwork}[2][]{\bigskip\par\centerline{#2}\bigskip\par}

%% Box Styles

%% Story head

%% Theorem styles
\def\thm@space@setup{%
  \thm@preskip=7\p@ \thm@postskip=7\p@
}
\thm@headpunct{}


%% Backmatter codings
\newif\ifbackmatter
\newcommand{\backmatter}{\par\global\backmattertrue}

%% Notation elements
%\newenvironment{notation}[1][Notation]{\begingroup\notationhead{#1}\small}{\endgroup}
\newcommand{\notationhead}[1]{\section*{#1\vspace*{-6pt}}}
\newcommand{\notationsubhead}[1]{\subsection*{#1\vspace*{-4pt}}}
\newenvironment{notationlist}[1][]{\begin{description}[#1]}{\end{description}}

%% Acknowledgments
\newenvironment{acknowledgements}[1][Acknowledgments]{\begingroup\section*{#1\vspace*{-2pt}}\nopagebreak\footnotesize}{\endgroup}

%% Author biography
%\newenvironment{biography}[1][Biographies]{\begingroup\subsection*{#1\vspace*{-6pt}}\nopagebreak\small\parindent=0pt\parskip4pt}{\endgroup}
\def\authorbiographyfont{\normalfont\fontsize{10bp}{13bp}\selectfont}
\newenvironment{authorbiography}{\removelastskip\smallskip\bigskip\authorbiographyfont\noindent\ignorespaces}{\par}
%%\newenvironment{authorbiography}{\bigskip\hrule\vspace*{5pt}\par\noindent\ignorespaces}{\par}
\newenvironment{biography}{\begingroup\nopagebreak\small\parindent=0pt\parskip4pt}{\endgroup}

%% Wrap Text
\definecolor{pullquotegray}{cmyk}{0,0,0,.54}
\newenvironment{pullquote}[1][h]{%
\begin{figure}[#1]
\vspace*{2pt}
\spaceskip4.75pt\ifodd\c@page\rightskip-7.5pc\else\leftskip-7.5pc\fi%
\fontsize{11bp}{19bp}\selectfont\color{pullquotegray}%
}{\vspace*{7pt}\end{figure}}

%% Keyterm with Web tint for Character w
\definecolor{webtintcolor}{cmyk}{0,0,0,.4}
\newcommand{\keyterm}[2][0pt]{%
    \marginnote{\vspace*{#1}\fboxsep=0pt\colorbox{webtintcolor}%
    {\rule{0pt}{8pt}\sffamily\phantom{w}\textcolor{white}{\itshape w}}%
    \vspace*{-3pt}\newline\sffamily\itshape\raggedright\fontsize{8bp}{9bp}\selectfont#2\endgraf}}

%% References
\def\bibliographyhead#1{\section*{#1}}

%% For Author Year representations
%\RequirePackage{natbib}
\renewenvironment{thebibliography}[1]{%
 %\bibsection
 \parindent\z@
 \bibpreamble
 \bibfont
 \list{\@biblabel{\the\c@NAT@ctr}}{\@bibsetup{#1}\global\c@NAT@ctr\z@}%
 \ifNAT@openbib
   \renewcommand\newblock{\par}%
 \else
   \renewcommand\newblock{\hskip .11em \@plus.33em \@minus.07em}%
 \fi
 \sloppy\clubpenalty4000\widowpenalty4000
 \sfcode`\.\@m
 \let\NAT@bibitem@first@sw\@firstoftwo
    \let\citeN\cite \let\shortcite\cite
    \let\citeasnoun\cite
}{%
 \bibitem@fin
 \bibpostamble
 \def\@noitemerr{%
  \PackageWarning{natbib}{Empty `thebibliography' environment}%
 }%
 \endlist
 \bibcleanup
}%
\newenvironment{thebibliography*}{\begin{thebibliography}}{\end{thebibliography}}

%% Supplementary Title
\newcommand{\supplementaryhead}[1]{\subsection*{#1\vspace*{-4pt}}}
\newenvironment{supplementary}{\begingroup\parindent0pt\parskip2pt\small}{\endgroup}

%% Examination elements
\newenvironment{examination}{\smallskip\begingroup}{\endgroup}
\newcommand{\examinationhead}[1]{\section*{#1\vspace*{-6pt}}}
\newcommand{\examinationsubhead}[1]{\subsection*{#1\vspace*{-4pt}}}
\newenvironment{examinationlist}[1][]{\begin{description}[#1]}{\end{description}}

%% Questions
\def\questionslabel{Questions}
%\newenvironment{questions}[1][\questionslabel]{\begingroup\subsection*{#1\vspace*{-4pt}}\nopagebreak}{\endgroup}
\newenvironment{questions}{\begingroup}{\endgroup}

%% Author queires
\newenvironment{authorquery}{\begingroup\small}{\endgroup}

%% For Notes head with grouping (For reduced point size)
\newcommand{\noteshead}[1]{\section*{#1\vspace*{6pt}}}
\def\notesenumargs{%
   \footnotesize%
   \leftmargini \parindent%
   \topsep 6pt%
   \partopsep     \z@%
   \itemsep       \z@%
   \parsep        \z@%
   \labelsep      .5em%
   \rightmargin   \z@%
   \listparindent \parindent%
   \itemindent    24pt}%

\def\endnotes{%
    \@ifnextchar[{\@nnumerate}{\@nnumerate[0.]}}

\def\noteshead{\section*{Notes\vspace*{6pt}}}
\def\@nnumerate[#1]{\par\noteshead%
     \ifnum \@enumdepth >3 \@toodeep\else
     \advance\@enumdepth \@ne
     \edef\@enumctr{enum\romannumeral\the\@enumdepth}
     \list{\csname label\@enumctr\endcsname}{%
       \notesenumargs\fontsize{9}{11}\selectfont%
       \setlength{\leftmargin}{\csname leftmargin\romannumeral\the\@enumdepth\endcsname}
       \usecounter{\@enumctr}
       \settowidth\labelwidth{#1}
       \leftmargin0pt
%       \addtolength{\leftmargin}{\labelwidth}
 %      \addtolength{\leftmargin}{\labelsep}
       \def\makelabel##1{\hss\llap{##1}}}%
     \fi
   }
\let\endendnotes\endlist

%% Appendix
\renewcommand{\appendix}{%
\@appendixtrue
\if@appendix
\setcounter{section}{0}
\setcounter{figure}{0}
\setcounter{table}{0}
\setcounter{equation}{0}
\def\thesection{A.\arabic{section}}
\def\thefigure{A.\arabic{figure}}
\def\thetable{A.\arabic{table}}
\def\theequation{A.\arabic{equation}}
\selectfont%
\fi}

\def\endappendix{\relax}%

\newcommand{\appsection}[1]{\section*{#1}}
\newcommand{\appsubsection}[1]{\subsection*{#1}}

%% Retained previous XML mappings from XLST conversion
\def\xmlsp#1{\textsuperscript{#1}}
\def\xmlsb#1{\textsubscript{#1}}

%% Front matter codings
%% Cover page
\newenvironment{jnlcoverpage}{\begingroup\onecolumn%
\thispagestyle{empty}\parskip0pt%
}{{\fontsize{16bp}{20bp}\selectfont\bfseries Volume \@jvol, Number \@jissue, \@jmonth\ \@jyear\par}\endgroup\clearpage}
\newcommand{\jnlcover}[1]{\centering{\fontsize{36bp}{40bp}\selectfont#1\vspace*{6pt}\par}}

\newenvironment{jnltitlepage}{\begingroup%
\thispagestyle{empty}%
\parindent0pt\parskip5.5pt%\leftskip11.5pc%
\parskip4pt%
%\jnllogo{\parbox[b]{11.5pc}{{\bfseries \ \null \\[53pt] Summer \@jyear \\[4pt] Volume \@jvol \\[4pt] Number \@jissue\\[16pt] \includegraphics{coverlogo.pdf} \\ \includegraphics{logo-print-1500.pdf}}}}%
{{\bfseries \@jmonth\ \@jyear \qquad Volume \@jvol \qquad Number \@jissue \\[6pt]
\includegraphics{coverlogo.pdf}\par}}%
}{\endgroup\clearpage}

\newcommand{\jnllogo}[1]{\rlap{\hspace*{-12pc}\vbox to 0pt{#1}}\par}
\newcommand{\jnltitle}[1]{{\fontsize{22bp}{36bp}\selectfont#1\vspace*{6pt}\par}}
\newcommand{\jnlmaintitle}[1]{\newline\fontsize{35bp}{36bp}\selectfont#1}
\newcommand{\jnlsubtitle}[1]{{\itshape\fontsize{14bp}{16bp}\selectfont#1\par}}

\newenvironment{toccontents}{\begingroup\parindent0pt\parskip4pt}{\endgroup\bigskip}
\newcommand{\tochead}[1]{{\sffamily\bfseries\fontsize{10bp}{14bp}\selectfont\vskip-3pt#1\vspace*{4.5pt}\par}}
\newcommand{\tocsubhead}[1]{{\sffamily\bfseries\fontsize{10bp}{14bp}\selectfont\bfseries#1\vspace*{1pt}\par}}
\newcommand{\tocsubsubhead}[1]{{\sffamily\fontsize{10bp}{14bp}\selectfont\bfseries#1\vspace*{1pt}\par}}
\newcommand{\toctitle}[2]{{\parbox[b]{\textwidth}{\raggedright\hangindent12pt#1\strut\par}}\hfill#2\strut\vspace*{-4pt}\nopagebreak\par}
\newcommand{\tocauthor}[2]{{\parbox[b]{\textwidth}{\raggedright\itshape#1\strut\par}}\hfill#2\strut\vspace*{2.75pt}\par}
\newcommand{\jnlphoto}[1]{\vspace*{-12pt}{\vbox to 0pt{\fontsize{6.5bp}{7bp}\selectfont#1}}\par}
%%\newcommand{\jnlphoto}[1]{\vspace*{-12pt}\rlap{\hspace*{-12pc}\vbox to 0pt{\fontsize{6.5bp}{7bp}\selectfont#1}}\par}

\newcommand{\jnleditorialtitle}[1]{\begin{figure*}[!h]\fontsize{14bp}{22pt}\selectfont#1\par\vspace*{-2pt}\end{figure*}}
\newcommand{\jnleditorialmaintitle}{\newline\fontsize{22.5bp}{22pt}\selectfont}
\newcommand{\jnleditorial}[1]{\vskip9pt{\bfseries#1\par\vspace*{-\parskip}}}
\newcommand{\jnlcolumnists}[1]{\vskip9pt{\bfseries#1\par}}
\newcommand{\jnleditorialboard}[1]{\vskip9pt{\bfseries#1\vspace*{-2pt}\par}}

\def\jnleditorialitemargs{%
   \leftmargini \parindent%
   \topsep        \z@%
   \partopsep     \z@%
   \itemsep       \z@%
   \parsep        \z@%
   \labelsep      1pt%
   \rightmargin   \z@%
   \raggedright\fontsize{7.5bp}{8bp}\selectfont%
   \listparindent \parindent%
   \itemindent    \z@
   }%

\def\jnleditorialitemize{%
   \@ifnextchar[{\@jnleditorialitemize}{\@jnleditorialitemize[$\bullet$]}}

\def\@jnleditorialitemize[#1]{\removelastskip\vspace*{-\parskip}\par%
     \ifnum \@itemdepth >3 \@toodeep\else
     \advance\@itemdepth \@ne
     \edef\@itemctr{item\romannumeral\the\@itemdepth}
     \list{\csname label\@itemctr\endcsname}{%
       \jnleditorialitemargs
       \setlength{\leftmargin}{\csname leftmargin\romannumeral\the\@itemdepth\endcsname}
       \settowidth\labelwidth{#1}
       \leftmargin7.5pt
       \addtolength{\leftmargin}{\labelwidth}
       \addtolength{\leftmargin}{\labelsep}
       \def\makelabel##1{\hss \llap{##1}}}%
     \fi
   }
\let\endjnleditorialitemize\endlist

\def\jnleditorialfontsize{\fontsize{7.5bp}{9bp}\selectfont}
\newenvironment{jnleditorialpage}{\begingroup%
    \let\itemize\jnleditorialitemize%
    \thispagestyle{empty}\parindent0pt\parskip5pt%
    \jnleditorialfontsize}{\endgraf\endgroup\clearpage}

%% Backmatter updates

%% Book Review bookreviewmaketitle Definition
\newcommand{\bookreviewtitlefont}{\normalfont\raggedright\fontsize{36bp}{40bp}\selectfont}
\newcommand{\bookreviewsubtitlefont}{\normalfont\raggedright\fontsize{24bp}{29bp}\selectfont}
\newcommand{\bookreviewauthorfont}{\normalfont\fontsize{12bp}{14bp}\selectfont}
\newcommand{\bookreviewaffiliationfont}{\normalfont\fontsize{12bp}{14bp}\selectfont}

\newcommand{\@bookreviewmaketitle}
{\noindent{{%
    %\hsize.95\textwidth
    \parindent0pt%
    \null\vskip-2pt\par%
    %% Aritle Title
    \ifx\@title\empty\else%
        {\bookreviewtitlefont\@title\strut\par}
        \addcontentsline{toc}{chapter}{\@title}% for bookmarks
    \fi%
    \vspace*{3pt}
    \ifx\@subtitle\empty\vspace*{30pt}\else{\bookreviewsubtitlefont\@subtitle\addvspace{6pt}}\fi%
    %% Aritle Authors, Address and Correspondings
    \vspace*{9pt}
    \ifx\@author\empty\vspace*{30pt}\else{\bookreviewauthorfont\@author\addvspace{6pt}}\fi%
  }}
\vskip10pt plus 5pt minus 5pt}

%% Maketitle settings
\newcommand\bookreviewmaketitle{\par
%%
\setcounter{section}{0}%
\setcounter{equation}{0}%
\setcounter{figure}{0}%
\setcounter{table}{0}%
\def\thesection{\arabic{section}}
\def\thefigure{\arabic{figure}}
\def\thetable{\arabic{table}}
\def\theequation{\arabic{equation}}
\setcounter{footnote}{0}%
%\setcounter{endnote}{0}%
\setcounter{querynote}{0}%
\setcounter{MSquerynotedisplay}{0}%
%%
  \begingroup%
   \thispagestyle{titlepage}%
    \renewcommand\thefootnote{}%{\@fnsymbol\c@footnote}%
    \gdef\@makefnmark{}%\rlap{\@textsuperscript{\normalfont\smash{\@thefnmark}}}}%
    \long\def\@makefntext##1{\parindent 0em\noindent\small\selectfont
            %\hbox{\@textsuperscript{\normalfont\@thefnmark}}
            ##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne%
        \twocolumn[\@bookreviewmaketitle]%
      \else
        \twocolumn[\@bookreviewmaketitle]%
      \fi%
    \else%
      \newpage%
      \global\@topnum\z@% Prevents figures from going at top of page.
      \@bookreviewmaketitle%
\par\addvspace{12pt}
\removelastskip\begin{center}
  \leftskip2em  plus1fill
  \rightskip2em  plus1fill
  \bookreviewauthorfont\@author%%
  \bookreviewaffiliationfont\@affiliation%%
  \bookreviewauthorfont\@secondauthor%%
  \bookreviewaffiliationfont\@secondaffiliation%%
  \bookreviewauthorfont\@thirdauthor%%
  \bookreviewaffiliationfont\@thirdaffiliation%%
  \bookreviewauthorfont\@fourthauthor%%
  \bookreviewaffiliationfont\@fourthaffiliation%%
  \bookreviewauthorfont\@fifthauthor%%
  \bookreviewaffiliationfont\@fifthaffiliation%%
  \bookreviewauthorfont\@sixthauthor%%
  \bookreviewaffiliationfont\@sixthaffiliation%%
  \bookreviewauthorfont\@sevenauthor%%
  \bookreviewaffiliationfont\@seventhaffiliation%%
  \bookreviewauthorfont\@eightauthor%%
  \bookreviewaffiliationfont\@eightaffiliation%%
  \bookreviewauthorfont\@ninthauthor%%
  \bookreviewaffiliationfont\@ninthaffiliation%%
\end{center}
%  \noindent\auaddress\par\addvspace{3pt}                        %%      For Multiple author and affiliations
%%  \noindent\printabstract\par
      \fi%
  \vskip20pt\endgroup%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax%
%%  \global\let\bookreviewmaketitle\relax%
%%  \global\let\@bookreviewmaketitle\relax%
  %\global\let\@thanks\@empty%
  \global\let\@author\@empty%
  \global\let\@date\@empty%
  %\global\let\@title\@empty%
%%
  \global\let\@articletype\relax%
  \global\let\@title\relax%
  \global\let\@subtitle\relax%
  \global\let\@author\relax%
  \global\let\@secondauthor\relax%
  \global\let\@thirdauthor\relax%
  \global\let\@fourthauthor\relax%
  \global\let\@fifthauthor\relax%
  \global\let\@sixthauthor\relax%
  \global\let\@sevenauthor\relax%
  \global\let\@eightauthor\relax%
  \global\let\@ninthauthor\relax%
  \global\let\@affiliation\relax%
  \global\let\@secondaffiliation\relax%
  \global\let\@thirdaffiliation\relax%
  \global\let\@fourthaffiliation\relax%
  \global\let\@fifthaffiliation\relax%
  \global\let\@sixthaffiliation\relax%
  \global\let\@seventhaffiliation\relax%
  \global\let\@eightaffiliation\relax%
  \global\let\@ninthaffiliation\relax%
  \global\let\@aueditor\relax%
  \global\let\@received\relax%
  \global\let\@received\relax%
  \global\let\@revised\relax%
  \global\let\@accepted\relax%
  \global\let\@collaborators\relax%
  \global\let\@abstract\relax%
  \global\let\@\@abscopyrights\relax%
  \global\let\@altabstract\relax%
%  \global\let\@abstractfigure\relax%
  \global\let\@keywords\relax%
  \global\let\@jelcodes\relax%
  \global\let\@corresp\relax%
  \global\let\@funding\relax%
  \global\let\@abbreviations\relax%
%  \global\let\@copyrightname\relax%
%%
  \global\let\date\relax%
  \global\let\and\relax
  \@afterheading
  \def\@makefnmark{\hbox{\@textsuperscript{\normalfont\@thefnmark}}}
\vskip6pt plus 5pt minus 5pt%
\setlength{\columnseprule}{0pt}%
\def\bibliographyhead##1{\section*{##1}}%
}%

%% Special FM boxes & headings, to change for requirements
\newenvironment{fmboxone}{\bigskip\begingroup\let\tochead\fmtochead\let\toctitle\fmtoctitle\let\tocauthor\fmtocauthor\let\title\fmboxonetitle\onecolumn\vspace*{-2pt}\fontsize{10bp}{12bp}\selectfont\parskip12pt\parindent0pt}{\par\endgroup\bigskip}
\newcommand{\fmboxonetitle}[1]{\begingroup\centering\fontsize{18bp}{20bp}\selectfont\bfseries\itshape#1\vspace*{-2pt}\strut\par\endgroup}
\newcommand{\fmtochead}[1]{{\vskip5pt\fontsize{12bp}{13bp}\selectfont#1\strut\par}}
\newcommand{\fmtoctitle}[2]{{\vskip2.5pt\rightskip5pc\hangindent12pt\lefthyphenmin=50\righthyphenmin=50\spaceskip4.75pt\fontsize{11bp}{13bp}\selectfont#1\hfill #2\hspace*{-5pc}\strut\nopagebreak\par}}
\newcommand{\fmtocauthor}[2]{{\vspace*{2pt}\parbox[b]{\textwidth-96pt}{\hangindent12pt\hangafter=0\raggedright\fontsize{12bp}{13bp}\selectfont\itshape#1\strut\par}}\hfill#2\strut\vspace*{4pt}\par}

\newenvironment{fmboxtwo}{\vskip-7pt\bigskip\begingroup\raggedright\let\title\fmboxtwotitle%
                                \let\enumerate\fmboxtwoenumerate\fontsize{12bp}{13bp}\selectfont\parskip0pt\parindent0pt}{\par\endgroup\bigskip}
\newcommand{\fmboxtwotitle}[1]{\begingroup\centering\fontsize{12bp}{13bp}\selectfont\bfseries#1\vspace*{-2pt}\strut\par\endgroup}

\def\fmboxtwoenumargs{%
   \leftmargini \parindent%
   \topsep 0pt%
   \partopsep     \z@%
   \itemsep       \z@%
   \parsep        \z@%
   \labelsep      9pt%
   \rightmargin   \z@%
   \listparindent \parindent%
   \itemindent    \z@}%
\def\fmboxtwoenumerate{%
    \@ifnextchar[{\@fmboxtwonumerate}{\@fmboxtwonumerate[0.]}}
\def\@fmboxtwonumerate[#1]{\par%
     \ifnum \@enumdepth >3 \@toodeep\else
     \advance\@enumdepth \@ne
     \edef\@enumctr{enum\romannumeral\the\@enumdepth}
     \list{\csname label\@enumctr\endcsname}{%
       \fmboxtwoenumargs%
       \setlength{\leftmargin}{\csname leftmargin\romannumeral\the\@enumdepth\endcsname}
       \usecounter{\@enumctr}
       \settowidth\labelwidth{#1}
       \leftmargin0pt
       \addtolength{\leftmargin}{\labelwidth}
       \addtolength{\leftmargin}{\labelsep}
       \def\makelabel##1{\hss\llap{##1}}}%
     \fi
   }
\let\endfmboxtwoenumerate\endlist

\newcommand{\fmheadone}[1]{\vskip13pt{\fontsize{12bp}{13bp}\selectfont\bfseries#1\strut\par}}
\newcommand{\fmheadtwo}[1]{{\fontsize{12bp}{13bp}\selectfont\itshape#1\strut\par}}
\newcommand{\fmheadthree}[1]{{\normalfont\bfseries\itshape#1\strut\par}}
\newcommand{\fmheadfour}[1]{{\normalfont\itshape#1\strut\par}}


%% Endmatters
%% Case Study Lists
\newenvironment{casestudy}{\clearpage\begingroup\let\enumerate\casestudyenumerate\let\endenumerate\endcasestudyenumerate\parindent0pt\onecolumn\normalsize}{\par\endgroup}
\newenvironment{casehead}{\begingroup\normalfont\bfseries\centering\fontsize{14bp}{17bp}\selectfont\strut}{\vspace*{3pt}\par\endgroup}
\newcommand{\casestudyhead}[1]{\medskip\fontsize{12bp}{14bp}\selectfont\textbf{\textit{#1}}\vspace*{6pt}\par}

\def\casestudyenumargs{%
   \leftmargini \parindent%
   \topsep 10pt%
   \partopsep     \z@%
   \itemsep       \z@%
   \parsep        \z@%
   \labelsep      .5em%
   \rightmargin   \z@%
   \listparindent \parindent%
   \itemindent    \z@}%
\def\casestudyenumerate{%
    \@ifnextchar[{\@casestudynumerate}{\@casestudynumerate[0.]}}
\def\@casestudynumerate[#1]{\par%
     \ifnum \@enumdepth >3 \@toodeep\else
     \advance\@enumdepth \@ne
     \edef\@enumctr{enum\romannumeral\the\@enumdepth}
     \list{\csname label\@enumctr\endcsname}{%
       \casestudyenumargs%
       \setlength{\leftmargin}{\csname leftmargin\romannumeral\the\@enumdepth\endcsname}
       \usecounter{\@enumctr}
       \settowidth\labelwidth{#1}
       \leftmargin0pt
       \addtolength{\leftmargin}{\labelwidth}
       \addtolength{\leftmargin}{\labelsep}
       \def\makelabel##1{\hss\llap{##1}}}%
     \fi
   }
\let\endcasestudyenumerate\endlist

%% multiplechoice
\def\multiplechoiceenumargs{%
   \leftmargini \parindent%
   \topsep 0pt%
   \partopsep     \z@%
   \itemsep       \z@%
   \parsep        \z@%
   \labelsep      .5em%
   \rightmargin   \z@%
   \listparindent \parindent%
   \itemindent    \z@}%
\def\multiplechoice{%
    \@ifnextchar[{\@multiplechoicenumerate}{\@multiplechoicenumerate[0.]}}
\def\@multiplechoicenumerate[#1]{\par%
     \ifnum \@enumdepth >3 \@toodeep\else
     \advance\@enumdepth \@ne
     \edef\@enumctr{enum\romannumeral\the\@enumdepth}
     \list{\csname label\@enumctr\endcsname}{%
       \multiplechoiceenumargs%
       \setlength{\leftmargin}{\csname leftmargin\romannumeral\the\@enumdepth\endcsname}
       \usecounter{\@enumctr}
       \settowidth\labelwidth{#1}
       \leftmargin0pt
       \addtolength{\itemindent}{\labelwidth}
       \addtolength{\itemindent}{\labelsep}
%       \addtolength{\leftmargin}{\labelwidth}
%       \addtolength{\leftmargin}{\labelsep}
       \def\makelabel##1{\hss\hbox to 25pt{\rlap{##1}}}%
       \fontsize{10bp}{10bp}\selectfont}%
     \fi
   }
\let\endmultiplechoice\endlist

%% choice
\def\choiceenumargs{%
   \leftmargini \parindent%
   \topsep 8pt%
   \partopsep     \z@%
   \itemsep       \z@%
   \parsep        \z@%
   \labelsep      .5em%
   \rightmargin   \z@%
   \listparindent \parindent%
   \itemindent    \z@}%
\def\choice{%
    \@ifnextchar[{\@choicenumerate}{\@choicenumerate[0.]}}
\def\@choicenumerate[#1]{\par%
     \ifnum \@enumdepth >3 \@toodeep\else
     \advance\@enumdepth \@ne
     \edef\@enumctr{enum\romannumeral\the\@enumdepth}
     \list{\csname label\@enumctr\endcsname}{%
       \choiceenumargs%
       \setlength{\leftmargin}{\csname leftmargin\romannumeral\the\@enumdepth\endcsname}
       \usecounter{\@enumctr}
       \settowidth\labelwidth{#1}
       \leftmargin30pt
       \addtolength{\leftmargin}{\labelwidth}
       \addtolength{\leftmargin}{\labelsep}
       \def\makelabel##1{\hss\llap{##1}}%
       \fontsize{10bp}{10bp}\selectfont}%
     \fi
   }
\let\endchoice\endlist



\usepackage[LY1]{fontenc}
\renewcommand\rmdefault{FSMe-TLF}
\renewcommand\sfdefault{FSMe-TLF}
\renewcommand\seriesdefault{l}
\renewcommand\mddefault{m}
\renewcommand\bfdefault{b}

\AtBeginDocument{
\pdfmapfile{+FSMe.map}
}



\newcommand\fakesc[1]{\normalfont\fauxschelper#1 \relax\relax}
\def\fauxschelper#1 #2\relax{%
  \fauxschelphelp#1\relax\relax%
  \if\relax#2\relax\else\ \fauxschelper#2\relax\fi}
\def\Hscale{.74}\def\Vscale{.74}\def\Cscale{1.00}
\def\fauxschelphelp#1#2\relax{%
  \ifnum`#1>``\ifnum`#1<`\{\scalebox{\Hscale}[\Vscale]{\uppercase{#1}}\else%
    \scalebox{\Cscale}[1]{#1}\fi\else\scalebox{\Cscale}[1]{#1}\fi%
  \ifx\relax#2\relax\else\fauxschelphelp#2\relax\fi}

\let\textsc\fakesc
%

%\usepackage{mathrsfs}


\newif\ifsupplementary\global\supplementaryfalse%
\def\supplementary{\global\supplementarytrue}

\newif\ifapparticle\global\apparticlefalse%
\def\apparticle{\global\apparticletrue}

%% Begin modification
%\jname{Violence and Victims}
\renewcommand\normalsize{%
   \@setfontsize\normalsize{9bp}{13bp}%
   \abovedisplayskip 9\p@ \@plus5\p@ \@minus2.5\p@%
   \abovedisplayshortskip 6\p@ \@plus3\p@ \@minus2\p@%
   \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus2\p@%
   \belowdisplayskip\abovedisplayskip%
   \let\@listi\@listI}%
\normalsize%
\let\@bls\baselineskip%

\renewcommand\small{%
   \@setfontsize\small{8bp}{10bp}%
   \abovedisplayskip 5\p@ \@plus3\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus2\p@
   \belowdisplayshortskip 3\p@ \@plus2\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 4\p@ \@plus2\p@ \@minus2\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip}

\renewcommand\footnotesize{%
   \@setfontsize\footnotesize{7bp}{9bp}%
   \abovedisplayskip 5\p@ \@plus2\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus\p@
   \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 3\p@ \@plus\p@ \@minus\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip}
%
\renewcommand\scriptsize{\@setfontsize\scriptsize\@ixpt\@ixpt}

\twocolumn

\columnsep23.5bp


\setlength\paperwidth{210truemm}
\setlength \paperheight{297truemm}

\newdimen\bsln
\bsln=13pt



\setlength\textwidth{476.5bp}             % text measure excluding margins
\setlength\textheight{56\bsln} % 58 + 1 = 59 lines
\addtolength\textheight{4.5bp}      %    including the first


\setlength\parindent{11\p@}

\setlength{\marginparsep}{12pt}
\setlength{\marginparwidth}{144pt}

%% Set page layout dimensions
\newlength\commargin
\setlength\commargin{\paperwidth}
\addtolength\commargin{-\textwidth}

\setlength\oddsidemargin{.5\commargin}
\addtolength\oddsidemargin{-1in}

\setlength\evensidemargin{.5\commargin}
\addtolength\evensidemargin{-1in}


%\addtolength{\oddsidemargin}{-1in}
%\addtolength{\evensidemargin}{-1in}

\setlength\headheight{7\p@}         % height of running head
\setlength\topmargin{41\p@}          % head margin %%Top of Text
\addtolength{\topmargin}{-1in}

\setlength\topskip{9.5\p@}           % height of first line of text
\setlength\headsep{27.5\p@}           % space below running head --
\addtolength\headsep{-3.5\p@}     %   base to base with first line of text

                                       %    line on the page
\setlength\footheight{8.25\p@}            % space above footer line
\setlength\footskip{19.5\p@}            % space above footer line
%\setlength\maxdepth{.2\topskip}     % pages can be short or deep by half a line?
%\twocolumn
%\setlength\columnsep{18bp}

%% Figure Special elements
\def\@figuretitle{}
\def\@figuretitleone{}  %% For Special title-1, if any
\def\@figuretitletwo{}  %% For Special title-1, if any
\def\@figurecaption{}
\def\@figuresubtitle{}
\def\@figuresource{}
\def\@figurenote{}
%
\newcommand{\figuretitle}[1]{{\gdef\@figuretitle{#1}}}
\newcommand{\figuretitleone}[1]{\gdef\@figuretitleone{#1\newline}}  %% For Special title-1, if any
\newcommand{\figuretitletwo}[1]{\gdef\@figuretitletwo{#1\newline}}  %% For Special title-1, if any
\newcommand{\figurecaption}[1]{\gdef\@figurecaption{#1\newline}}
\newcommand{\figuresubtitle}[1]{\gdef\@figuresubtitle{#1\newline}}
\newcommand{\figuresource}[1]{\gdef\@figuresource{#1\newline}}
\newcommand{\figurenote}[1]{\gdef\@figurenote{\fontsize{9bp}{10bp}\selectfont#1\par}}


%% Floats
\renewcommand\figurename{Figure}
\renewcommand\tablename{Table}


%% Article Type
\sodef\articletracking{}{.1em}{.4em plus1em}{.5em plus1em minus1em}
\def\articletype#1{\gdef\ArtType{\articletracking{#1}}\gdef\@ArtType{#1}}
%\articletype{}

%%% Font Def
\def\subtitlefont{\fontfamily{\sfdefault}\fontsize{12bp}{14bp}\selectfont}
\def\titlefont{\def\textit##1{{\fontfamily{FSMe-TLF}\fontseries{m}\fontshape{it}\selectfont##1}}\color{white}\fontencoding{LY1}\fontfamily{FSMe-TLF}\fontseries{md}\fontsize{23bp}{28bp}\selectfont\raggedright}
\def\aueditorfont{\fontfamily{\sfdefault}\fontsize{8bp}{10bp}\selectfont}
\def\authorfont{\color{BlueTextColor}\bfseries\fontsize{10bp}{12bp}\selectfont}
\def\afflnotefont{\color{BlueTextColor}\normalfont\fontfamily{\rmdefault}\fontsize{8bp}{10bp}\selectfont}
\def\sptitlefont{\fontfamily{FSMe-TLF}\bfseries\fontsize{10bp}{16bp}\selectfont}
\def\arttypefont{\def\textit##1{{\fontfamily{FSMe-TLF}\fontseries{m}\fontshape{it}\selectfont##1}}\color{BlueTextColor}\fontfamily{FSMe-TLF}\fontseries{md}\fontsize{10bp}{16bp}\selectfont}
\def\affiliationfont{\fontsize{8bp}{10bp}\selectfont}
\def\fundingfont{\normalfont\fontsize{9bp}{11bp}\selectfont}
\def\titleurlfont{\normalfont\fontsize{9bp}{11bp}\selectfont}
\def\addressfont{\normalfont\fontsize{9bp}{11bp}\selectfont\itshape}
\def\corresfont{\normalfont\raggedright\parskip3pt\fontfamily{\rmdefault}\fontsize{8bp}{11bp}\selectfont}
\def\abstractfont{\normalfont\parskip6pt\fontsize{9bp}{13bp}\selectfont}%
\def\abstractheadfont{\color{BlueTextColor}\normalfont\fontsize{12bp}{15bp}\bfseries\selectfont}%
\def\rhfont{\def\textit##1{{\fontfamily{FSMe-TLF}\fontseries{m}\fontshape{it}\selectfont##1}}\fontfamily{FSMe-TLF}\fontseries{m}\fontsize{7bp}{7bp}\selectfont}
\def\rhauthorfont{\def\textit##1{{\fontfamily{FSMe-TLF}\fontseries{m}\fontshape{it}\selectfont##1}}\fontfamily{FSMe-TLF}\fontseries{m}\fontsize{7bp}{7bp}\selectfont}
\def\howtociteauthorfont{\fontsize{8bp}{11bp}\selectfont}

\def\titlemark#1{\gdef\@titlemark{#1}}
\def\authormark#1{\gdef\@authormark{#1}}

\newif\ifversohead%
\versoheadfalse

\newcount\authcnt%
\authcnt=0%

\def\thanksfootnote#1{\gdef\@thanksfootnote{#1}}\gdef\@thanksfootnote{}

%% Author Type
\sodef\authortracking{}{.1em}{.4em plus1em}{.5em plus1em minus1em}



\renewcommand{\author}[2][1]{\advance\authcnt by 1%
 \ifnum#1=1\gdef\@author{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=2\gdef\@secondauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=3\gdef\@thirdauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=4\gdef\@fourthauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=5\gdef\@fifthauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=6\gdef\@sixthauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=7\gdef\@sevenauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=8\gdef\@eightauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=9\gdef\@ninthauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=10\gdef\@tenthauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=11\gdef\@eleventhauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=12\gdef\@twelthauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=13\gdef\@thirteenthauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=14\gdef\@fourteenthauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=15\gdef\@fifteenthauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=16\gdef\@sixteenthauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=17\gdef\@seventeenthauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=18\gdef\@eighteenthauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=19\gdef\@nineteenthauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=20\gdef\@twentythauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=21\gdef\@twentyonethauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=22\gdef\@twentytwoauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=23\gdef\@twentythridauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=24\gdef\@twentyfourthauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=25\gdef\@twentyfivethauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=26\gdef\@twentysixthauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=27\gdef\@twentyseventhauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=28\gdef\@twentyeightthauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=29\gdef\@twentyninethauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=30\gdef\@thirtythauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=31\gdef\@thirtyoneauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=32\gdef\@thirtytwoauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=33\gdef\@thirtythridauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=34\gdef\@thirtyfourthauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=35\gdef\@thirtyfivethauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=36\gdef\@thirtysixthauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=37\gdef\@thirtyseventhauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=38\gdef\@thirtyeightthauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=39\gdef\@thirtyninethauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=40\gdef\@fourtyauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=41\gdef\@fourtyoneauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=42\gdef\@fourtytwoauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=43\gdef\@fourtythridauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=44\gdef\@fourtyfourthauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=45\gdef\@fourtyfivethauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=46\gdef\@fourtysixthauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=47\gdef\@fourtyseventhauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=48\gdef\@fourtyeightthauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=49\gdef\@fourtyninethauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=50\gdef\@fiftytyauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=51\gdef\@fiftyoneauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=52\gdef\@fiftytwoauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=53\gdef\@fiftythridauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=54\gdef\@fiftyfourthauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=55\gdef\@fiftyfivethauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=56\gdef\@fiftysixthauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=57\gdef\@fiftyseventhauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=58\gdef\@fiftyeightthauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=59\gdef\@fiftyninethauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=60\gdef\@sixtyauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=61\gdef\@sixtyoneauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=62\gdef\@sixtytwoauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=63\gdef\@sixtythridauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=64\gdef\@sixtyfourthauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=65\gdef\@sixtyfivethauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=66\gdef\@sixtysixthauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=67\gdef\@sixtyseventhauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=68\gdef\@sixtyeightthauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=69\gdef\@sixtyninethauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=70\gdef\@seventyauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=71\gdef\@seventyoneauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=72\gdef\@seventytwoauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=73\gdef\@seventythridauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=74\gdef\@seventyfourthauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=75\gdef\@seventyfivethauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=76\gdef\@seventysixthauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=77\gdef\@seventyseventhauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=78\gdef\@seventyeightthauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=79\gdef\@seventyninethauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=80\gdef\@eigthtyauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=81\gdef\@eightyoneauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=82\gdef\@eightytwoauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=83\gdef\@eightythridauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=84\gdef\@eightyfourthauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=85\gdef\@eightyfivethauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=86\gdef\@eightysixthauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=87\gdef\@eightyseventhauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=88\gdef\@eightyeightthauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=89\gdef\@eightyninethauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=90\gdef\@ninetyauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=91\gdef\@ninetyoneauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=92\gdef\@ninetytwoauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=93\gdef\@ninetythridauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=94\gdef\@ninetyfourthauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=95\gdef\@ninetyfivethauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=96\gdef\@ninetysixthauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=97\gdef\@ninetyseventhauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=98\gdef\@ninetyeightthauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=99\gdef\@ninetyninethauthor{{\authorfont\if@boxtypefour#2\else\uppercase{#2}\fi}}\else
 \ifnum#1=100\gdef\@hundaredauthor
\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi%
\gdef\@authormark{#2}}



\def\rectohead#1{\gdef\@titlemark{#1}}
\def\versohead#1{\versoheadtrue\gdef\@versomark{#1}}

\def\rectoheadtop#1{\gdef\@rectoheadtop{#1}}\gdef\@rectoheadtop{}
\def\versoheadtop#1{\gdef\@versoheadtop{#1}}\gdef\@versoheadtop{}

\def\rectoprefix#1{\gdef\@rectoprefix{#1}}\gdef\@rectoprefix{}
\def\versoprefix#1{\gdef\@versoprefix{#1}}\gdef\@versoprefix{}

\gdef\@author{}
\gdef\@secondauthor{}
\gdef\@thirdauthor{}
\gdef\@fourthauthor{}
\gdef\@fifthauthor{}
\gdef\@sixthauthor{}
\gdef\@seventhauthor{}
\gdef\@eightauthor{}
\gdef\@ninthauthor{}
\gdef\@tenthauthor{}
\gdef\@eleventhauthor{}
\gdef\@twelthauthor{}
\gdef\@thirteenthauthor{}
\gdef\@fourteenthauthor{}
\gdef\@fifteenthauthor{}
\gdef\@sixteenthauthor{}
\gdef\@seventeenthauthor{}
\gdef\@eighteenthauthor{}
\gdef\@nineteenthauthor{}
\gdef\@twentythauthor{}
\gdef\@twentyonethauthor{}
\gdef\@twentytwoauthor{}
\gdef\@twentythridauthor{}
\gdef\@twentyfourthauthor{}
\gdef\@twentyfivethauthor{}
\gdef\@twentysixthauthor{}
\gdef\@twentyseventhauthor{}
\gdef\@twentyeightthauthor{}
\gdef\@twentyninethauthor{}
\gdef\@thirtythauthor{}
\gdef\@thirtyoneauthor{}
\gdef\@thirtytwoauthor{}
\gdef\@thirtythridauthor{}
\gdef\@thirtyfourthauthor{}
\gdef\@thirtyfivethauthor{}
\gdef\@thirtysixthauthor{}
\gdef\@thirtyseventhauthor{}
\gdef\@thirtyeightthauthor{}
\gdef\@thirtyninethauthor{}
\gdef\@fourtyauthor{}
\gdef\@fourtyoneauthor{}
\gdef\@fourtytwoauthor{}
\gdef\@fourtythridauthor{}
\gdef\@fourtyfourthauthor{}
\gdef\@fourtyfivethauthor{}
\gdef\@fourtysixthauthor{}
\gdef\@fourtyseventhauthor{}
\gdef\@fourtyeightthauthor{}
\gdef\@fourtyninethauthor{}
\gdef\@fiftytyauthor{}
\gdef\@fiftyoneauthor{}
\gdef\@fiftytwoauthor{}
\gdef\@fiftythridauthor{}
\gdef\@fiftyfourthauthor{}
\gdef\@fiftyfivethauthor{}
\gdef\@fiftysixthauthor{}
\gdef\@fiftyseventhauthor{}
\gdef\@fiftyeightthauthor{}
\gdef\@fiftyninethauthor{}
\gdef\@sixtyauthor{}
\gdef\@sixtyoneauthor{}
\gdef\@sixtytwoauthor{}
\gdef\@sixtythridauthor{}
\gdef\@sixtyfourthauthor{}
\gdef\@sixtyfivethauthor{}
\gdef\@sixtysixthauthor{}
\gdef\@sixtyseventhauthor{}
\gdef\@sixtyeightthauthor{}
\gdef\@sixtyninethauthor{}
\gdef\@seventyauthor{}
\gdef\@seventyoneauthor{}
\gdef\@seventytwoauthor{}
\gdef\@seventythridauthor{}
\gdef\@seventyfourthauthor{}
\gdef\@seventyfivethauthor{}
\gdef\@seventysixthauthor{}
\gdef\@seventyseventhauthor{}
\gdef\@seventyeightthauthor{}
\gdef\@seventyninethauthor{}
\gdef\@eigthtyauthor{}
\gdef\@eightyoneauthor{}
\gdef\@eightytwoauthor{}
\gdef\@eightythridauthor{}
\gdef\@eightyfourthauthor{}
\gdef\@eightyfivethauthor{}
\gdef\@eightysixthauthor{}
\gdef\@eightyseventhauthor{}
\gdef\@eightyeightthauthor{}
\gdef\@eightyninethauthor{}
\gdef\@ninetyauthor{}
\gdef\@ninetyoneauthor{}
\gdef\@ninetytwoauthor{}
\gdef\@ninetythridauthor{}
\gdef\@ninetyfourthauthor{}
\gdef\@ninetyfivethauthor{}
\gdef\@ninetysixthauthor{}
\gdef\@ninetyseventhauthor{}
\gdef\@ninetyeightthauthor{}
\gdef\@ninetyninethauthor{}
\gdef\@hundaredauthor{}


\renewcommand{\title}[2][]{\gdef\@shorttitle{#1}\ifx\@shorttitle\empty\gdef\@title{#2}\titlemark{#2}\gdef\s@title{#2}\else\gdef\@title{#2}\titlemark{#2}\gdef\s@title{#1}\fi}
\def\subtitle#1{\gdef\@subtitle{{#1\strut\vskip3.5pt}}}\gdef\@subtitle{}%
%\def\affiliation#1{\gdef\@affiliation{{#1}}}\gdef\@affiliation{}%
\newcommand{\aff}[2][1]{%
\ifnum#1=1\gdef\@affiliation{{\affiliationfont#2}\par\addvspace{13pt}}\else%
    \ifnum#1=2\gdef\@secondaffiliation{#2\par\addvspace{13pt}}\else%
        \ifnum#1=3\gdef\@thirdaffiliation{#2\par\addvspace{13pt}}\else%
            \ifnum#1=4\gdef\@fourthaffiliation{#2\par\addvspace{13pt}}\else%
               \ifnum#1=5\gdef\@fifthaffiliation{#2\par\addvspace{13pt}}\else%
                    \ifnum#1=6\gdef\@sixthaffiliation{#2\par\addvspace{13pt}}\else%
                        \ifnum#1=7\gdef\@seventhaffiliation{#2\par\addvspace{13pt}}\else%
                            \ifnum#1=8\gdef\@eightaffiliation{#2\par\addvspace{13pt}}\else%
                                \ifnum#1=9\gdef\@ninthaffiliation{#2\par\addvspace{13pt}}\else%
                                \ifnum#1=10\gdef\@tenthaffiliation{#2\par\addvspace{13pt}}\else%
\ifnum#1=11\gdef\@eleventhaffiliation{#2\par\addvspace{13pt}}\else%
\ifnum#1=12\gdef\@twelthaffiliation{#2\par\addvspace{13pt}}\else%
\ifnum#1=13\gdef\@thirteenthaffiliation{#2\par\addvspace{13pt}}\else%
\ifnum#1=14\gdef\@fourteenthaffiliation{#2\par\addvspace{13pt}}\else%
\ifnum#1=15\gdef\@fifteenthaffiliation{#2\par\addvspace{13pt}}\else%
\ifnum#1=16\gdef\@sixteenthaffiliation{#2\par\addvspace{13pt}}\else%
\ifnum#1=17\gdef\@seventeenthaffiliation{#2\par\addvspace{13pt}}\else%
\ifnum#1=18\gdef\@eightteenthaffiliation{#2\par\addvspace{13pt}}\else%
\ifnum#1=19\gdef\@nineteenthaffiliation{#2\par\addvspace{13pt}}\else%
\ifnum#1=20\gdef\@twentythaffiliation{#2\par\addvspace{13pt}}\else%
\ifnum#1=21\gdef\@twentyonethaffiliation{#2\par\addvspace{13pt}}\else%
\ifnum#1=22\gdef\@twentytwothaffiliation{#2\par\addvspace{13pt}}\else%
\ifnum#1=23\gdef\@twentythridffiliation{#2\par\addvspace{13pt}}\else%
\ifnum#1=24\gdef\@twentyfourthaffiliation{#2\par\addvspace{13pt}}\else%
\ifnum#1=25\gdef\@twentyfifthaffiliation{#2\par\addvspace{13pt}}\else%
\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi%
}

\gdef\@affiliation{}%
\gdef\@secondaffiliation{}%
\gdef\@thirdaffiliation{}%
\gdef\@fourthaffiliation{}%
\gdef\@fifthaffiliation{}%
\gdef\@sixthaffiliation{}%
\gdef\@seventhaffiliation{}%
\gdef\@eightaffiliation{}%
\gdef\@ninthaffiliation{}%
\gdef\@tenthaffiliation{}%
\gdef\@eleventhaffiliation{}%
\gdef\@twelthaffiliation{}%
\gdef\@thirteenthaffiliation{}%
\gdef\@fourteenthaffiliation{}%
\gdef\@fifteenthaffiliation{}%
\gdef\@sixteenthaffiliation{}%
\gdef\@seventeenthaffiliation{}%
\gdef\@eightteenthaffiliation{}%
\gdef\@nineteenthaffiliation{}%
\gdef\@twentythaffiliation{}%
\gdef\@twentyonethaffiliation{}%
\gdef\@twentytwothaffiliation{}%
\gdef\@twentythridffiliation{}%
\gdef\@twentyfourthaffiliation{}%
\gdef\@twentyfifthaffiliation{}%
%% Abstract

\usepackage{enumitem}    %% For list items


\newbox\abstracttextbox%

\newif\ifnobookmark \global\nobookmarkfalse



\newtcolorbox{absbox}{arc=0pt,outer arc=0pt,sharp corners,boxrule=0pt,boxsep=0pt,height=445.8bp,width=360bp,
colback=abstractbg,colbacktitle=abstractbg,left skip=-16pt,colframe=abstractbg,valign=top,boxsep=6bp,fontupper={\abstractfont}}

\renewenvironment{abstract}[1][]{\hsize=\textwidth\global\nobookmarktrue\global\abstracttrue\Abswordsectrue%%
\global\setbox\abstracttextbox\vbox\bgroup\parindent=0pt\topsep0pt\nointerlineskip\vskip-20pt\nointerlineskip%
\ignorespaces\begin{absbox}{{\abstractheadfont\MakeUppercase#1}}\par\addvspace{-1pt}}{\end{absbox}\egroup\global\nobookmarkfalse}%

\gdef\printabstract{%
    {\unvbox\abstracttextbox}%
    \ifx\@altabstract\empty\else\vskip8pt\noindent\@altabstract\fi%
\par\nointerlineskip\addvspace{8pt}\ignorespaces\nointerlineskip}%

\gdef\printkeywords{%
    {\unvbox\keywords}%
\par\nointerlineskip\addvspace{10pt}\ignorespaces\nointerlineskip}%

\newbox\keywordsbox%
\newbox\keywords
\newenvironment{keyword}[1][]{\hsize=110pt\global\nobookmarktrue\Keywordsectrue%
%\let\section\kwdsection%
\global\setbox\keywords\vbox\bgroup\nointerlineskip\nointerlineskip\parindent=0pt\vskip3pt\nointerlineskip%
\corresfont\ignorespaces\textbf{\color{BlueTextColor}#1}\par\addvspace{-2pt}%
\raggedright}{\egroup\global\nobookmarkfalse}%

\gdef\printcorres{%
    {\unvbox\corresbox}%
\par\nointerlineskip\ignorespaces\nointerlineskip}%

\newbox\corresbox
\newenvironment{corres}[1][]{\hsize=110pt\global\nobookmarktrue
\global\setbox\corresbox\vbox\bgroup\nointerlineskip\nointerlineskip\parindent=0pt\vskip3pt\nointerlineskip%
\corresfont\ignorespaces\textbf{\color{BlueTextColor}#1}\par\addvspace{-2pt}%
\raggedright}{\egroup\global\nobookmarkfalse}%


\gdef\printartdetails{%
\corresfont\par\ignorespaces\textbf{\color{BlueTextColor}TO CITE THIS ARTICLE:}\par\addvspace{-2pt}
\ifcase\howtociteauthcnt\relax
\or\@howtociteauthor\or
\@howtociteauthor\ {\&} \@secondhowtociteauthor\or
\@howtociteauthor{,} \@secondhowtociteauthor{,} {\&} \@thirdhowtociteauthor\or
\@howtociteauthor{,} \@secondhowtociteauthor{,} \@thirdhowtociteauthor{,} {\&} \@fourthhowtociteauthor\or
\@howtociteauthor{,} \@secondhowtociteauthor{,} \@thirdhowtociteauthor{,} \@fourthhowtociteauthor{,} {\&} \@fifthhowtociteauthor\or
\@howtociteauthor{,} \@secondhowtociteauthor{,} \@thirdhowtociteauthor{,} \@fourthhowtociteauthor{,} \@fifthhowtociteauthor{,} {\&} \@sixthhowtociteauthor\or
\@howtociteauthor{,} \@secondhowtociteauthor{,} \@thirdhowtociteauthor{,} \@fourthhowtociteauthor{,} \@fifthhowtociteauthor{,} \@sixthhowtociteauthor{,} {\&}  \@sevenhowtociteauthor\or
\@howtociteauthor{,} \@secondhowtociteauthor{,} \@thirdhowtociteauthor{,} \@fourthhowtociteauthor{,} \@fifthhowtociteauthor{,} \@sixthhowtociteauthor{,} \@sevenhowtociteauthor{,} {\&} \@eighthowtociteauthor\or
\@howtociteauthor{,} \@secondhowtociteauthor{,} \@thirdhowtociteauthor{,} \@fourthhowtociteauthor{,} \@fifthhowtociteauthor{,} \@sixthhowtociteauthor{,} \@sevenhowtociteauthor{,} \@eighthowtociteauthor{,} {\&} \@ninthhowtociteauthor\or
\@howtociteauthor{,} \@secondhowtociteauthor{,} \@thirdhowtociteauthor{,} \@fourthhowtociteauthor{,} \@fifthhowtociteauthor{,} \@sixthhowtociteauthor{,} \@sevenhowtociteauthor{,} \@eighthowtociteauthor{,} \@ninthhowtociteauthor{,} {\&} \@tenthhowtociteauthor\or
\@howtociteauthor{,} \@secondhowtociteauthor{,} \@thirdhowtociteauthor{,} \@fourthhowtociteauthor{,} \@fifthhowtociteauthor{,} \@sixthhowtociteauthor{,} \@sevenhowtociteauthor{,} \@eighthowtociteauthor{,} \@ninthhowtociteauthor{,} \@tenthhowtociteauthor{,} {\&} \@eleventhhowtociteauthor\or
\@howtociteauthor{,} \@secondhowtociteauthor{,} \@thirdhowtociteauthor{,} \@fourthhowtociteauthor{,} \@fifthhowtociteauthor{,} \@sixthhowtociteauthor{,} \@sevenhowtociteauthor{,} \@eighthowtociteauthor{,} \@ninthhowtociteauthor{,} \@tenthhowtociteauthor{,} \@eleventhhowtociteauthor{,}  {\&} \@twelthhowtociteauthor\or
\@howtociteauthor{,} \@secondhowtociteauthor{,} \@thirdhowtociteauthor{,} \@fourthhowtociteauthor{,} \@fifthhowtociteauthor{,} \@sixthhowtociteauthor{,} \@sevenhowtociteauthor{,} \@eighthowtociteauthor{,} \@ninthhowtociteauthor{,} \@tenthhowtociteauthor{,} \@eleventhhowtociteauthor{,} \@twelthhowtociteauthor{,} {\&} \@thirteenthhowtociteauthor\or
\@howtociteauthor{,} \@secondhowtociteauthor{,} \@thirdhowtociteauthor{,} \@fourthhowtociteauthor{,} \@fifthhowtociteauthor{,} \@sixthhowtociteauthor{,} \@sevenhowtociteauthor{,} \@eighthowtociteauthor{,} \@ninthhowtociteauthor{,} \@tenthhowtociteauthor{,} \@eleventhhowtociteauthor{,} \@twelthhowtociteauthor{,} \@thirteenthhowtociteauthor{,} {\&} \@fourteenthhowtociteauthor\or
\fi.\@titlemark. \textit{Journal Title}. \@jyear; \@jvol(\@jissue): 00, \MSFirstPage--\MSLastPage.\break DOI: \textcolor{BlueTextColor}{https://\@doi}}

\newbox\artdetailsbox
\newenvironment{artdetails}[1][]{\hsize=110pt\global\nobookmarktrue
\global\setbox\artdetailsbox\vbox\bgroup\nointerlineskip\nointerlineskip\parindent=0pt\vskip3pt\nointerlineskip%
\corresfont\par\ignorespaces\textbf{\color{BlueTextColor}#1}\par\addvspace{-2pt}%
\raggedright}{\egroup\global\nobookmarkfalse}%


\gdef\printjelcodes{
{\unvbox\jelcodesbox}%
\par\nointerlineskip\addvspace{10pt}\ignorespaces\nointerlineskip}%


\newbox\jelcodesbox
\renewenvironment{jelcodes}[1][]{\hsize=\textwidth\global\nobookmarktrue
%\Keywordsectrue%
%\let\section\kwdsection%
\global\setbox\jelcodesbox\vbox\bgroup\nointerlineskip\parindent=10pt\nointerlineskip\vskip3pt\nointerlineskip%
\abstractfont\ignorespaces\textbf{#1\enspace}\ignorespaces\noindent\ignorespaces\parindent=10pt}{\egroup\global\nobookmarkfalse}%


\def\afflnote#1{\gdef\@afflnote{{\afflnotefont#1}}}\gdef\@afflnote{}%


\newcount\rhauthcnt%
\rhauthcnt=0%

\newcommand{\rhauthor}[2][1]{\advance\rhauthcnt by 1%
 \ifnum#1=1\gdef\@rhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=2\gdef\@secondrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=3\gdef\@thirdrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=4\gdef\@fourthrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=5\gdef\@fifthrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=6\gdef\@sixthrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=7\gdef\@sevenrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=8\gdef\@eightrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=9\gdef\@ninthrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=10\gdef\@tenthrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=11\gdef\@eleventhrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=12\gdef\@twelthrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=13\gdef\@thirteenthrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=14\gdef\@fourteenthrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=15\gdef\@fifteenthrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=16\gdef\@sixteenthrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=17\gdef\@seventeenthrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=18\gdef\@eighteenthrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=19\gdef\@nineteenthrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=20\gdef\@twentythrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=21\gdef\@twentyonethrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=22\gdef\@twentytworhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=23\gdef\@twentythridrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=24\gdef\@twentyfourthrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=25\gdef\@twentyfivethrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=26\gdef\@twentysixthrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=27\gdef\@twentyseventhrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=28\gdef\@twentyeightthrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=29\gdef\@twentyninethrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=30\gdef\@thirtythrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=31\gdef\@thirtyonerhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=32\gdef\@thirtytworhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=33\gdef\@thirtythridrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=34\gdef\@thirtyfourthrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=35\gdef\@thirtyfivethrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=36\gdef\@thirtysixthrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=37\gdef\@thirtyseventhrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=38\gdef\@thirtyeightthrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=39\gdef\@thirtyninethrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=40\gdef\@fourtyrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=41\gdef\@fourtyonerhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=42\gdef\@fourtytworhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=43\gdef\@fourtythridrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=44\gdef\@fourtyfourthrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=45\gdef\@fourtyfivethrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=46\gdef\@fourtysixthrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=47\gdef\@fourtyseventhrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=48\gdef\@fourtyeightthrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=49\gdef\@fourtyninethrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=50\gdef\@fiftytyrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=51\gdef\@fiftyonerhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=52\gdef\@fiftytworhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=53\gdef\@fiftythridrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=54\gdef\@fiftyfourthrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=55\gdef\@fiftyfivethrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=56\gdef\@fiftysixthrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=57\gdef\@fiftyseventhrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=58\gdef\@fiftyeightthrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=59\gdef\@fiftyninethrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=60\gdef\@sixtyrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=61\gdef\@sixtyonerhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=62\gdef\@sixtytworhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=63\gdef\@sixtythridrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=64\gdef\@sixtyfourthrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=65\gdef\@sixtyfivethrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=66\gdef\@sixtysixthrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=67\gdef\@sixtyseventhrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=68\gdef\@sixtyeightthrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=69\gdef\@sixtyninethrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=70\gdef\@seventyrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=71\gdef\@seventyonerhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=72\gdef\@seventytworhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=73\gdef\@seventythridrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=74\gdef\@seventyfourthrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=75\gdef\@seventyfivethrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=76\gdef\@seventysixthrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=77\gdef\@seventyseventhrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=78\gdef\@seventyeightthrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=79\gdef\@seventyninethrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=80\gdef\@eigthtyrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=81\gdef\@eightyonerhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=82\gdef\@eightytworhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=83\gdef\@eightythridrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=84\gdef\@eightyfourthrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=85\gdef\@eightyfivethrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=86\gdef\@eightysixthrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=87\gdef\@eightyseventhrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=88\gdef\@eightyeightthrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=89\gdef\@eightyninethrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=90\gdef\@ninetyrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=91\gdef\@ninetyonerhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=92\gdef\@ninetytworhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=93\gdef\@ninetythridrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=94\gdef\@ninetyfourthrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=95\gdef\@ninetyfivethrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=96\gdef\@ninetysixthrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=97\gdef\@ninetyseventhrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=98\gdef\@ninetyeightthrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=99\gdef\@ninetyninethrhauthor{{\rhauthorfont#2}}\else
 \ifnum#1=100\gdef\@hundaredrhauthor
\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi%
}


\def\RHAuthor{\rhauthorfont\def\authorfont{}\ifcase\rhauthcnt\relax \or\@author \or
\@rhauthor\ and \@secondrhauthor\or
\@rhauthor, \@secondrhauthor\ and \@thirdrhauthor\or
\@rhauthor\ et al.\fi}


\def\rhtitle#1{\gdef\@rhtitle{{\rhfont\color{75black}\itshape#1}}}\gdef\@rhtitle{}%

\def\sptitle#1{\gdef\@sptitle{\parbox{110pt}{\raggedright\sptitlefont\MakeUppercase{#1}}}}\gdef\@sptitle{}%

\def\articletype#1{\gdef\@articletype{\parbox{110pt}{\raggedright\arttypefont\bfseries\articletype\MakeUppercase{#1}}}}\gdef\@articletype{}%

\newcommand\publisherlogo{\includegraphics[width=120pt]{./Styles/Publisher_Logo_FPO.pdf}}

\newcommand\societylogo{\includegraphics{./Styles/Society_Logo_FPO.pdf}}

\def\doiline#1{\gdef\@doiline{{\corresfont This article has\hfill\break
been corrected here: \href{#1}{\textcolor{BlueTextColor}{\wrapletters{#1}}}}}}\gdef\@doiline{}%


\def\titleurl#1{\gdef\@titleurl{#1}}\gdef\@titleurl{}%

\definecolor{BlueTextColor}{cmyk}{0.69,0.49,0.16,0.01}


\renewcommand\orchid[2]{\if@boxtypefour\href{#1}{\includegraphics{./Styles/orchidlogo.pdf}\space{}{\reset@font\affiliationfont\textcolor{BlueTextColor}{#1}}}%
\else\href{#1}{\includegraphics{./Styles/orchidlogo.pdf}}\fi}



\newcommand\titlebox[1]{\begin{tcolorbox}[arc=0pt,outer arc=0pt,sharp corners,boxrule=0pt,boxsep=0pt,height=258.8bp,width=360bp,
colback=BlueTextColor,colbacktitle=BlueTextColor,left skip=-16pt,left=-2pt,colframe=BlueTextColor,valign=bottom,boxsep=12bp,fontupper={\titlefont}]
\begin{picture}(1,1)(-326,-121.5)
\includegraphics[height=38.5bp]{./Styles/Open_Access_logo_white}
\end{picture}
\parindent0pt\parbox{270pt}{\raggedright#1}\end{tcolorbox}}


%% Article Header Definition
\renewcommand{\@maketitle}
{\ifx\@title\empty\else%
        {\vspace*{-83.6pt}\titlebox{\@title} \par\vspace*{-19pt}}
        \protect\phantomsection\addcontentsline{toc}{toctitle}{\@title}% for bookmarks
    \fi%
    %% Aritle Authors, Address and Correspondings
  }

%% Maketitle settings
\renewcommand\maketitle{\par
%%
\global\@appendixfalse%\def\appendix#1{\relax}%
%\if@ProofPDF\enlargethispage{-80pt}%\fi
\setcounter{section}{0}%
\setcounter{equation}{0}%
\setcounter{figure}{0}%
\setcounter{table}{0}%
%\def\thesection{\arabic{section}}
\def\thefigure{\arabic{figure}}
\def\thetable{\arabic{table}}
\def\theequation{\arabic{equation}}
\setcounter{footnote}{0}%
%\setcounter{endnote}{0}%
\@definecounter{querynote}
\@definecounter{MSquerynotedisplay}
\setcounter{querynote}{0}%
\setcounter{MSquerynotedisplay}{0}%
%%
  \begingroup%
   \thispagestyle{empty}%
       \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \gdef\@makefnmark{}%\rlap{\@textsuperscript{\normalfont\smash{\@thefnmark}}}}%
    \long\def\@makefntext##1{\parindent 0em\noindent\small\selectfont
            %\hbox{\@textsuperscript{\normalfont\@thefnmark}}
            ##1\vspace*{-6pt}}%
      \newpage%
      \global\@topnum\z@% Prevents figures from going at top of page.
      %\thispagestyle{empty}
     \twocolumn[\begin{minipage}{350pt}\vbox to 355pt{{\@maketitle}%
\par\addvspace{30.5pt}
  \noindent{\aueditorfont\@aueditor}%%
\removelastskip
%  \leftskip2em  plus1fill
%  \rightskip2em  plus1fill
\vspace*{-13.5pt}\par\addvspace{8pt}
\ifx\@sixthauthor\empty\else\vspace*{-12.5pt}\begin{multicols}{2}\fi
\ifcase\authcnt\relax \or\@author \or
\@author\par\addvspace{5pt} \@secondauthor\or
\@author\par\addvspace{5pt} \@secondauthor\par\addvspace{5pt} \@thirdauthor\or
\@author\par\addvspace{5pt} \@secondauthor\par\addvspace{5pt} \@thirdauthor\columnbreak\par\addvspace{5pt} \@fourthauthor\or
\@author\par\addvspace{5pt} \@secondauthor\par\addvspace{5pt} \@thirdauthor\columnbreak\par\addvspace{5pt} \@fourthauthor\par\addvspace{5pt} \@fifthauthor\or
\@author\par\addvspace{5pt} \@secondauthor\par\addvspace{5pt} \@thirdauthor\columnbreak\par\addvspace{5pt} \@fourthauthor\par\addvspace{5pt} \@fifthauthor\par\addvspace{5pt} \@sixthauthor\or
\@author\par\addvspace{5pt} \@secondauthor\par\addvspace{5pt} \@thirdauthor\par\addvspace{5pt} \@fourthauthor\columnbreak\par\addvspace{5pt} \@fifthauthor\par\addvspace{5pt} \@sixthauthor\par\addvspace{5pt} \@sevenauthor\or
\@author\par\addvspace{5pt} \@secondauthor\par\addvspace{5pt} \@thirdauthor\columnbreak\par\addvspace{5pt} \@fourthauthor\par\addvspace{5pt} \@fifthauthor\par\addvspace{5pt} \@sixthauthor\par\addvspace{5pt} \@sevenauthor\par\addvspace{5pt} \@eightauthor\or
\@author\par\addvspace{5pt} \@secondauthor\par\addvspace{5pt} \@thirdauthor\columnbreak\par\addvspace{5pt} \@fourthauthor\par\addvspace{5pt} \@fifthauthor\par\addvspace{5pt} \@sixthauthor\par\addvspace{5pt} \@sevenauthor\par\addvspace{5pt} \@eightauthor\par\addvspace{5pt} \@ninthauthor\or
\@author\par\addvspace{5pt} \@secondauthor\par\addvspace{5pt} \@thirdauthor\par\addvspace{5pt} \@fourthauthor\par\addvspace{5pt} \@fifthauthor\columnbreak\par\addvspace{5pt} \@sixthauthor\par\addvspace{5pt} \@sevenauthor\par\addvspace{5pt} \@eightauthor\par\addvspace{5pt} \@ninthauthor\par\addvspace{5pt} \@tenthauthor\or
\@author\par\addvspace{5pt} \@secondauthor\par\addvspace{5pt} \@thirdauthor\par\addvspace{5pt} \@fourthauthor\par\addvspace{5pt} \@fifthauthor\par\addvspace{5pt} \@sixthauthor\columnbreak\par\addvspace{5pt} \@sevenauthor\par\addvspace{5pt} \@eightauthor\par\addvspace{5pt} \@ninthauthor\par\addvspace{5pt} \@tenthauthor\par\addvspace{5pt} \@eleventhauthor\or
\@author\par\addvspace{5pt} \@secondauthor\par\addvspace{5pt} \@thirdauthor\par\addvspace{5pt} \@fourthauthor\par\addvspace{5pt} \@fifthauthor\par\addvspace{5pt} \@sixthauthor\columnbreak\par\addvspace{5pt} \@sevenauthor\par\addvspace{5pt} \@eightauthor\par\addvspace{5pt} \@ninthauthor\par\addvspace{5pt} \@tenthauthor\par\addvspace{5pt} \@eleventhauthor\par\addvspace{5pt} \@twelthauthor\or
\@author\par\addvspace{5pt} \@secondauthor\par\addvspace{5pt} \@thirdauthor\par\addvspace{5pt} \@fourthauthor\par\addvspace{5pt} \@fifthauthor\par\addvspace{5pt} \@sixthauthor\par\addvspace{5pt} \@sevenauthor\columnbreak\par\addvspace{5pt} \@eightauthor\par\addvspace{5pt} \@ninthauthor\par\addvspace{5pt} \@tenthauthor\par\addvspace{5pt} \@eleventhauthor\par\addvspace{5pt} \@twelthauthor\par\addvspace{5pt} \@thirteenthauthor\or
\@author\par\addvspace{5pt} \@secondauthor\par\addvspace{5pt} \@thirdauthor\par\addvspace{5pt} \@fourthauthor\par\addvspace{5pt} \@fifthauthor\par\addvspace{5pt} \@sixthauthor\par\addvspace{5pt} \@sevenauthor\columnbreak\par\addvspace{5pt} \@eightauthor\par\addvspace{5pt} \@ninthauthor\par\addvspace{5pt} \@tenthauthor\par\addvspace{5pt} \@eleventhauthor\par\addvspace{5pt} \@twelthauthor\par\addvspace{5pt} \@thirteenthauthor\par\addvspace{5pt} \@fourteenthauthor\or
\@author\par\addvspace{5pt} \@secondauthor\par\addvspace{5pt} \@thirdauthor\par\addvspace{5pt} \@fourthauthor\par\addvspace{5pt} \@fifthauthor\par\addvspace{5pt} \@sixthauthor\par\addvspace{5pt} \@sevenauthor\par\addvspace{5pt} \@eightauthor\columnbreak\par\addvspace{5pt} \@ninthauthor\par\addvspace{5pt} \@tenthauthor\par\addvspace{5pt} \@eleventhauthor\par\addvspace{5pt} \@twelthauthor\par\addvspace{5pt} \@thirteenthauthor\par\addvspace{5pt} \@fourteenthauthor\par\addvspace{5pt} \@fifteenthauthor\or
\@author\par\addvspace{5pt} \@secondauthor\par\addvspace{5pt} \@thirdauthor\par\addvspace{5pt} \@fourthauthor\par\addvspace{5pt} \@fifthauthor\par\addvspace{5pt} \@sixthauthor\par\addvspace{5pt} \@sevenauthor\par\addvspace{5pt} \@eightauthor\columnbreak\par\addvspace{5pt} \@ninthauthor\par\addvspace{5pt} \@tenthauthor\par\addvspace{5pt} \@eleventhauthor\par\addvspace{5pt} \@twelthauthor\par\addvspace{5pt} \@thirteenthauthor\par\addvspace{5pt} \@fourteenthauthor\par\addvspace{5pt} \@fifteenthauthor\par\addvspace{5pt} \@sixteenthauthor\or
\@author\par\addvspace{5pt} \@secondauthor\par\addvspace{5pt} \@thirdauthor\par\addvspace{5pt} \@fourthauthor\par\addvspace{5pt} \@fifthauthor\par\addvspace{5pt} \@sixthauthor\par\addvspace{5pt} \@sevenauthor\par\addvspace{5pt} \@eightauthor\par\addvspace{5pt} \@ninthauthor\columnbreak\par\addvspace{5pt} \@tenthauthor\par\addvspace{5pt} \@eleventhauthor\par\addvspace{5pt} \@twelthauthor\par\addvspace{5pt} \@thirteenthauthor\par\addvspace{5pt} \@fourteenthauthor\par\addvspace{5pt} \@fifteenthauthor\par\addvspace{5pt} \@sixteenthauthor\par\addvspace{5pt} \@seventeenthauthor\or
\@author\par\addvspace{5pt} \@secondauthor\par\addvspace{5pt} \@thirdauthor\par\addvspace{5pt} \@fourthauthor\par\addvspace{5pt} \@fifthauthor\par\addvspace{5pt} \@sixthauthor\par\addvspace{5pt} \@sevenauthor\par\addvspace{5pt} \@eightauthor\par\addvspace{5pt} \@ninthauthor\columnbreak\par\addvspace{5pt} \@tenthauthor\par\addvspace{5pt} \@eleventhauthor\par\addvspace{5pt} \@twelthauthor\par\addvspace{5pt} \@thirteenthauthor\par\addvspace{5pt} \@fourteenthauthor\par\addvspace{5pt} \@fifteenthauthor\par\addvspace{5pt} \@sixteenthauthor\par\addvspace{5pt} \@seventeenthauthor\par\addvspace{5pt} \@eighteenthauthor\or
\@author\par\addvspace{5pt} \@secondauthor\par\addvspace{5pt} \@thirdauthor\par\addvspace{5pt} \@fourthauthor\par\addvspace{5pt} \@fifthauthor\par\addvspace{5pt} \@sixthauthor\par\addvspace{5pt} \@sevenauthor\par\addvspace{5pt} \@eightauthor\par\addvspace{5pt} \@ninthauthor\par\addvspace{5pt} \@tenthauthor\columnbreak\par\addvspace{5pt} \@eleventhauthor\par\addvspace{5pt} \@twelthauthor\par\addvspace{5pt} \@thirteenthauthor\par\addvspace{5pt} \@fourteenthauthor\par\addvspace{5pt} \@fifteenthauthor\par\addvspace{5pt} \@sixteenthauthor\par\addvspace{5pt} \@seventeenthauthor\par\addvspace{5pt} \@eighteenthauthor\par\addvspace{5pt} \@nineteenthauthor\or
\@author\par\addvspace{5pt} \@secondauthor\par\addvspace{5pt} \@thirdauthor\par\addvspace{5pt} \@fourthauthor\par\addvspace{5pt} \@fifthauthor\par\addvspace{5pt} \@sixthauthor\par\addvspace{5pt} \@sevenauthor\par\addvspace{5pt} \@eightauthor\par\addvspace{5pt} \@ninthauthor\par\addvspace{5pt} \@tenthauthor\columnbreak\par\addvspace{5pt} \@eleventhauthor\par\addvspace{5pt} \@twelthauthor\par\addvspace{5pt} \@thirteenthauthor\par\addvspace{5pt} \@fourteenthauthor\par\addvspace{5pt} \@fifteenthauthor\par\addvspace{5pt} \@sixteenthauthor\par\addvspace{5pt} \@seventeenthauthor\par\addvspace{5pt} \@eighteenthauthor\par\addvspace{5pt} \@nineteenthauthor\par\addvspace{5pt} \@twentythauthor\or
\fi
\ifx\@sixthauthor\empty\else\end{multicols}\vspace*{-12.5pt}\fi
\vspace*{0pt}\par\addvspace{4pt}\ifx\@afflnote\empty\else\@afflnote\fi\vfill}
\ifnobookmark\addcontentsline{toc}{tocauthor}{
\ifcase\authcnt\relax
\or\@author\or
\@author and \@secondauthor\or
\@author, \@secondauthor, and \@thirdauthor\or
\@author, \@secondauthor, \@thirdauthor, and \@fourthauthor\or
\@author, \@secondauthor, \@thirdauthor, \@fourthauthor, and \@fifthauthor\or
\@author, \@secondauthor, \@thirdauthor, \@fourthauthor, \@fifthauthor, and \@sixthauthor\or
\@author, \@secondauthor, \@thirdauthor, \@fourthauthor, \@fifthauthor, \@sixthauthor, and  \@sevenauthor\or
\@author, \@secondauthor, \@thirdauthor, \@fourthauthor, \@fifthauthor, \@sixthauthor, \@sevenauthor, and \@eightauthor\or
\@author, \@secondauthor, \@thirdauthor, \@fourthauthor, \@fifthauthor, \@sixthauthor, \@sevenauthor, \@eightauthor, and \@ninthauthor\or
\@author, \@secondauthor, \@thirdauthor, \@fourthauthor, \@fifthauthor, \@sixthauthor, \@sevenauthor, \@eightauthor, \@ninthauthor, and \@tenthauthor\or
\@author, \@secondauthor, \@thirdauthor, \@fourthauthor, \@fifthauthor, \@sixthauthor, \@sevenauthor, \@eightauthor, \@ninthauthor, \@tenthauthor, and \@eleventhauthor\or
\@author, \@secondauthor, \@thirdauthor, \@fourthauthor, \@fifthauthor, \@sixthauthor, \@sevenauthor, \@eightauthor, \@ninthauthor, \@tenthauthor, \@eleventhauthor,  and \@twelthauthor\or
\@author, \@secondauthor, \@thirdauthor, \@fourthauthor, \@fifthauthor, \@sixthauthor, \@sevenauthor, \@eightauthor, \@ninthauthor, \@tenthauthor, \@eleventhauthor, \@twelthauthor, and \@thirteenthauthor\or
\@author, \@secondauthor, \@thirdauthor, \@fourthauthor, \@fifthauthor, \@sixthauthor, \@sevenauthor, \@eightauthor, \@ninthauthor, \@tenthauthor, \@eleventhauthor, \@twelthauthor, \@thirteenthauthor, and \@fourteenthauthor\or\fi}\else\fi
 \ifx\@collaborators\empty\else\@collaborators\fi %% To check
\vspace*{-4pt}
\noindent\printabstract\par\addvspace{10pt}%
\ifx\@abbreviations\empty\else{\@abbreviations}\vskip5pt\fi%
\nointerlineskip\vskip7.5pt\nointerlineskip\end{minipage}\hspace*{-94pt}%
\begin{minipage}{115pt}\vbox to 740pt{\vspace*{-60pt}{\includegraphics[width=115pt]{./Styles/Journal_TISMIR_Logo.pdf}}
\par\addvspace{126pt}%
\ifx\@sptitle\empty\vspace*{20pt}\else\@sptitle\fi\par\addvspace{16pt}
\ifx\@articletype\empty\else\@articletype\fi\par\addvspace{45pt}
\publisherlogo\par\addvspace{13pt}
%\societylogo\par
\vfill\vbox to 458pt{\vspace*{13.35pt}
\ifx\@doiline\empty\else\@doiline\fi\par\addvspace{11pt}
\printcorres\par\addvspace{16.5pt}
{\color{BlueTextColor}\rule{110pt}{2pt}}
\par\addvspace{7.5pt}
\printkeywords\par\addvspace{9.5pt}
\printartdetails\vfill
\vspace*{32.4pt}}}\end{minipage}]\endgroup%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax%
  \global\let\@date\@empty%
  \global\let\@articletype\relax%
  \global\let\@title\relax%
  \global\let\@subtitle\relax%
  \global\let\@aueditor\relax%
  \global\let\@collaborators\relax%
  \global\let\@abstract\relax%
  \global\let\@\@abscopyrights\relax%
  \global\let\@altabstract\relax%
  \global\let\@keywords\relax%
  \global\let\@jelcodes\relax%
  \global\let\@corresp\relax%
  \global\let\@funding\relax%
  \global\let\@abbreviations\relax%
%%
  \global\let\date\relax%
  \global\let\and\relax
  \@afterheading
  \def\@makefnmark{{\textsuperscript{\normalfont\@thefnmark}}}
\vskip-04pt% plus 5pt minus 5pt
\vfill}%


%% Article Header Definition
\newcommand{\@editorialmaketitle}
{\noindent{{%
    \hsize\textwidth\parindent0pt%
    \null\vskip24pt\par%
    \null{\articletypefont\@ArtType\strut\hfill\par}
    \null\vskip24pt\par%
    \ifx\@subtitle\empty\vspace*{0pt}\else{\subtitlefont\@subtitle\addvspace{6pt}}\fi%
    %% Aritle Title
\vskip0pt\vskip-72pt\vskip0pt%
    \ifx\@title\empty\else%
        {\titlefont \@title \par\vskip-18pt}
        \protect\phantomsection\addcontentsline{toc}{toctitle}{\@title}% for bookmarks
    \fi%
    %% Aritle Authors, Address and Correspondings
  }}
}

%% Maketitle settings
\newcommand\editorialmaketitle{\par
%%
\global\@appendixfalse%\def\appendix#1{\relax}%
\setcounter{section}{0}%
\setcounter{equation}{0}%
\setcounter{figure}{0}%
\setcounter{table}{0}%
\def\thesection{\arabic{section}}
\def\thefigure{\arabic{figure}}
\def\thetable{\Roman{table}}
\def\theequation{\arabic{equation}}
\setcounter{footnote}{0}%
%\setcounter{endnote}{0}%
\@definecounter{querynote}
\@definecounter{MSquerynotedisplay}
\setcounter{querynote}{0}%
\setcounter{MSquerynotedisplay}{0}%
%%
  \begingroup%
   \thispagestyle{titlepage}%
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \gdef\@makefnmark{}%\rlap{\@textsuperscript{\normalfont\smash{\@thefnmark}}}}%
    \long\def\@makefntext##1{\parindent 0em\noindent\small\selectfont
            %\hbox{\@textsuperscript{\normalfont\@thefnmark}}
            ##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne%
        \twocolumn[\@editorialmaketitle]%
      \else
        \twocolumn[\@editorialmaketitle]%
      \fi%
    \else%
      \newpage%
      \global\@topnum\z@% Prevents figures from going at top of page.
      \@editorialmaketitle%
\par\addvspace{38.5pt}
  \noindent{\aueditorfont\@aueditor}%%
\removelastskip
  \leftskip2em  plus1fill
  \rightskip2em  plus1fill
  \authorfont\@author%%
  \affiliationfont\@affiliation%%
  \authorfont\@secondauthor%%
  \affiliationfont\@secondaffiliation%%
  \authorfont\@thirdauthor%%
  \affiliationfont\@thirdaffiliation%%
  \authorfont\@fourthauthor%%
  \affiliationfont\@fourthaffiliation%%
  \authorfont\@fifthauthor%%
  \affiliationfont\@fifthaffiliation%%
  \authorfont\@sixthauthor%%
  \affiliationfont\@sixthaffiliation%%
  \authorfont\@seventhauthor%%
  \affiliationfont\@seventhaffiliation%%
  \authorfont\@eightauthor%%
  \affiliationfont\@eightaffiliation%%
  \authorfont\@ninthauthor%%
  \affiliationfont\@ninthaffiliation%%
\addcontentsline{toc}{tocauthor}{
\ifcase\authcnt\relax
\or\@author\or
\@author, and \@secondauthor\or
\@author, \@secondauthor, and \@thirdauthor\or
\@author, \@secondauthor, \@thirdauthor, and \@fourthauthor\or
\@author, \@secondauthor, \@thirdauthor, \@fourthauthor, and \@fifthauthor\or
\@author, \@secondauthor, \@thirdauthor, \@fourthauthor, \@fifthauthor, and \@sixthauthor\or
\@author, \@secondauthor, \@thirdauthor, \@fourthauthor, \@fifthauthor, \@sixthauthor, and  \@sevenauthor\or
\@author, \@secondauthor, \@thirdauthor, \@fourthauthor, \@fifthauthor, \@sixthauthor, \@sevenauthor, and \@eightauthor\or
\@author, \@secondauthor, \@thirdauthor, \@fourthauthor, \@fifthauthor, \@sixthauthor, \@sevenauthor, \@eightauthor, and \@ninthauthor\or
\@author, \@secondauthor, \@thirdauthor, \@fourthauthor, \@fifthauthor, \@sixthauthor, \@sevenauthor, \@eightauthor, \@ninthauthor, and \@tenthauthor\or
\@author, \@secondauthor, \@thirdauthor, \@fourthauthor, \@fifthauthor, \@sixthauthor, \@sevenauthor, \@eightauthor, \@ninthauthor, \@tenthauthor, and \@eleventhauthor\or
\@author, \@secondauthor, \@thirdauthor, \@fourthauthor, \@fifthauthor, \@sixthauthor, \@sevenauthor, \@eightauthor, \@ninthauthor, \@tenthauthor, \@eleventhauthor,  and \@twelthauthor\or
\@author, \@secondauthor, \@thirdauthor, \@fourthauthor, \@fifthauthor, \@sixthauthor, \@sevenauthor, \@eightauthor, \@ninthauthor, \@tenthauthor, \@eleventhauthor, \@twelthauthor, and \@thirteenthauthor\or
\@author, \@secondauthor, \@thirdauthor, \@fourthauthor, \@fifthauthor, \@sixthauthor, \@sevenauthor, \@eightauthor, \@ninthauthor, \@tenthauthor, \@eleventhauthor, \@twelthauthor, \@thirteenthauthor, and \@fourteenthauthor\or\fi}
 \ifx\@corresp\empty\else\@corresp\fi
 \ifx\@collaborators\empty\else\@collaborators\fi %% To check
%  \noindent\auaddress\par\addvspace{3pt}                        %%      For Multiple author and affiliations
\noindent\ifx\@funding\empty\else{\fundingfont\@funding}\par\addvspace{8pt}\fi\vskip1.5pt    %%      Funding adress
\noindent\printabstract\par\addvspace{-3pt}%
      \fi%
{\normalfont\fontsize{9bp}{11bp}\selectfont\par\addvspace{0pt}%
\noindent\ifx\@received\empty\else\@received\space\fi%
         \ifx\@revised\empty\else\@revised\space\fi%
         \ifx\@accepted\empty\else\@accepted\space\fi%
         \ifx\@published\empty\else\@published\fi%
\par\addvspace{1pt}}%
\ifx\keywords\empty\else\noindent{\unvbox\keywords}\vskip0pt\vskip6pt\vskip0pt\fi%
\ifx\@jelcodes\empty\else{\@jelcodes}\vskip5pt\fi%
\ifx\@abbreviations\empty\else{\@abbreviations}\vskip5pt\fi%
\nointerlineskip\vskip7.5pt\nointerlineskip\endgroup%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax%
%%  \global\let\maketitle\relax%
%%  \global\let\@maketitle\relax%
  %\global\let\@thanks\@empty%
  \global\let\@author\@empty%
  \global\let\@date\@empty%
  %\global\let\@title\@empty%
%%
  \global\let\@articletype\relax%
  \global\let\@title\relax%
  \global\let\@subtitle\relax%
  \global\let\@author\relax%
  \global\let\@secondauthor\relax%
  \global\let\@thirdaffiliation\relax%
  \global\let\@fourthaffiliation\relax%
  \global\let\@fifthaffiliation\relax%
  \global\let\@sixthaffiliation\relax%
  \global\let\@seventhaffiliation\relax%
  \global\let\@eightaffiliation\relax%
  \global\let\@ninthauthor\relax%
  \global\let\@ninthaffiliation\relax%
  \global\let\@affiliation\relax%
  \global\let\@secondaffiliation\relax%
  \global\let\@thirdaffiliation\relax%
  \global\let\@fourthaffiliation\relax%
  \global\let\@fifthaffiliation\relax%
  \global\let\@sixthaffiliation\relax%
  \global\let\@seventhaffiliation\relax%
  \global\let\@eightaffiliation\relax%
  \global\let\@aueditor\relax%
  \global\let\@received\relax%
  \global\let\@received\relax%
  \global\let\@revised\relax%
  \global\let\@accepted\relax%
  \global\let\@collaborators\relax%
  \global\let\@abstract\relax%
  \global\let\@\@abscopyrights\relax%
  \global\let\@altabstract\relax%
%  \global\let\@abstractfigure\relax%
  \global\let\@keywords\relax%
  \global\let\@jelcodes\relax%
  \global\let\@corresp\relax%
  \global\let\@funding\relax%
  \global\let\@abbreviations\relax%
%  \global\let\@copyrightname\relax%
%%
  \global\let\date\relax%
  \global\let\and\relax
  \@afterheading
  \def\@makefnmark{{\textsuperscript{\normalfont\@thefnmark}}}
\vskip-26pt plus 5pt minus 5pt}%

\usepackage{xstring}

\gdef\@filename{}
\def\dummyalpha{VV}%
\def\filename#1{\StrBefore{#1}{VV}[\grabfile]\StrBehind{#1}{VV}[\exactfilename]\gdef\@filename{\dummyalpha\exactfilename}}
\def\issn#1{\gdef\@issn{#1}}

\def\spjvolxxxiv{34}
\def\spjvolxxxv{35}

\gdef\@filename{}
\def\filename#1{\gdef\@filename{\ignorespaces#1}}

\newbox\papbox%


%% Running heads
%% Opening Page Style
\def\ps@titlepage{%
      \def\@oddhead{\hbox to \textwidth{\if@ProofPDF\else\rlap{\smash{\raisebox{-505pt}{\hspace*{-39pt}\vbox{\rotatebox{90}{\TimesNewRomanFont\fontsize{8bp}{10bp}\selectfont\begin{tabu}{C{410pt}}J. Math. Log. 2022.22. Downloaded from www.worldscientific.com\\[-7pt] by WSPC on \today. Re-use and distribution is strictly not permitted, except for Open Access articles.\end{tabu}}}}}}\fi}}%
      \def\@evenhead{\hbox to \textwidth{\if@ProofPDF\else\rlap{\smash{\raisebox{-505pt}{\hspace*{-39pt}\vbox{\rotatebox{90}{\TimesNewRomanFont\fontsize{8bp}{10bp}\selectfont\begin{tabu}{C{410pt}}J. Math. Log. 2022.22. Downloaded from www.worldscientific.com\\[-7pt] by WSPC on \today. Re-use and distribution is strictly not permitted, except for Open Access articles.\end{tabu}}}}}}\fi}}%
     \def\@oddfoot{\hbox to \textwidth{\hfill\fontsize{8bp}{8bp}\selectfont\@artid-\thepage\hfill}}
     \def\@evenfoot{\hbox to \textwidth{\hfill\fontsize{8bp}{8bp}\selectfont\@artid-\thepage\hfill}}}%

\def\ps@plain{%
     \let\@oddhead\@empty%
     \let\@evenhead\@empty%
     \def\@oddfoot{\hsize=\textwidth\centerline{\thepage}}%
     \def\@evenfoot{\centerline{\thepage}}%
     }


\def\ps@headings{%
      \def\@oddhead{\hbox to \textwidth{\ifx\@rectoheadtop\empty\RHAuthor\ {\rhfont\color{75black}\textit{\@jname}}\space{\rhfont\color{75black}DOI: \@doi}\else\rhfont\@rectoheadtop\fi\hfill\rhfont\bfseries\thepage}}%
      \def\@evenhead{\hbox to \textwidth{\ifx\@versoheadtop\empty\RHAuthor\ {\rhfont\color{75black}\textit{\@jname}}\space{\rhfont\color{75black}DOI: \@doi}\else\rhfont\@versoheadtop\fi\hfill\rhfont\bfseries\thepage}}%
      \let\@mkboth\markboth%
      \def\@oddfoot{}
        \def\@evenfoot{}      }
\pagestyle{headings}
%% End Running heads

%% dropcap
\renewcommand*{\LettrineTextFont}{\normalfont}
%\newcommand{\Dropcaps}[1]{\lettrine[lines=3,findent=2pt,nindent=0pt,loversize=0.134]#1}
\newcommand{\Dropcaps}[1]{\lettrine[lines=3,findent=4pt,slope=0pt,nindent=0pt]{\fontsize{47.81bp}{47.81bp}\selectfont{#1}}\normalfont}


%% Sections
\setcounter{secnumdepth}{4}
\AtBeginDocument{\renewcommand\thesection{\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection.\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}}


\let\sectitle=J%
\let\subsectitle=Z%
\let\subsubsectitle=Z%
\let\paragraphtitle=Z%

\newif\ifAbswordsec%
\newif\ifKeywordsec%


\AtBeginDocument{
\def\@startsection#1#2#3#4#5#6{%
  \if@noskipsec \leavevmode \fi
  \par
  \@tempskipa #4\relax
  \@afterindenttrue
  \ifdim \@tempskipa <\z@
    \@tempskipa -\@tempskipa \@afterindentfalse
  \fi
 \ifnum#2=2\vspace*{-0pt}\fi
\ifnum#2=4\vspace*{0pt}\fi
   \if@nobreak
  \ifnum#2=2\fi
    \everypar{}%
  \else
    \addpenalty\@secpenalty\addvspace\@tempskipa
  \fi
  \@ifstar
    {\@ssect{#3}{#4}{#5}{#6}}%
    {\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}}
\def\@seccntformat#1{\csname the#1\endcsname\space}%
\def\@sect#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
    \protected@edef\@svsec{\@seccntformat{#1}\relax}%
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
    \begingroup
\ifnum#2=1%
      #6{%
        %\@hangfrom
        {\hskip #3\relax\@svsec}%
          \interlinepenalty \@M #8\@@par}%
\else%
      #6{%
        {\hspace*{-11pt}\@svsec}%
          \interlinepenalty \@M #8\@@par}%
\fi%
    \endgroup
    \csname #1mark\endcsname{#7}%
    \addcontentsline{toc}{#1}{%
      \ifnum #2>\c@secnumdepth \else
        \protect\numberline{\csname the#1\endcsname}%
      \fi
      #7}%
  \else
    \def\@svsechd{%
      #6{\hskip #3\relax
      \@svsec \MakeUppercase{#8}}%
      \csname #1mark\endcsname{#7}%
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \protect\numberline{\csname the#1\endcsname}%
        \fi
        #7}}%
  \fi
  \@xsect{#5}}}



%% Sections
\setcounter{secnumdepth}{3}

\def\abssectionfont{\raggedright\fontfamily{\rmdefault}\fontsize{9bp}{11bp}\selectfont}
\def\keysectionfont{\raggedright\fontfamily{\rmdefault}\fontsize{10bp}{12bp}\selectfont\bfseries}
\def\sectionfont{\mathversion{bold}\fontfamily{\rmdefault}\fontsize{12bp}{15bp}\color{BlueTextColor}\selectfont\bfseries}
\def\subsectionfont{\mathversion{bold}\fontfamily{\rmdefault}\fontsize{10bp}{13bp}\selectfont\bfseries}
\def\subsubsectionfont{\def\textit##1{{\fontfamily{FSMe-TLF}\fontseries{m}\fontshape{it}\selectfont##1}}\fontfamily{FSMe-TLF}\fontseries{md}\fontsize{10bp}{13bp}\selectfont}
\def\paragraphfont{\def\textit##1{{\fontfamily{FSMe-TLF}\fontseries{m}\fontshape{it}\selectfont##1}}\fontfamily{FSMe-TLF}\fontseries{md}\itshape\fontsize{9bp}{12bp}\selectfont}
\def\subparagraphfont{\mathversion{bold}\fontsize{9bp}{11bp}\selectfont\bfseries\itshape}

\renewcommand\section{\needspace{0.15in}\@startsection {section}{1}{0\p@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {13pt}%
                                   {\sectionfont\raggedright\MakeUppercase}}
\renewcommand\subsection{\@startsection{subsection}{2}{0\p@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {0.1pt}%
                                     {\subsectionfont\MakeUppercase}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{0\p@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {0.1pt}%
                                     {\subsubsectionfont}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{0\p@}%
                                    {-15pt}%
                                    {0.1pt}%
                                    {\paragraphfont}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{0\p@}%
                                       {-3.25ex \@plus1ex \@minus .2ex}%
                                       {0.1pt}%
                                      {\subparagraphfont}}

%% Floats
\renewenvironment{table}
               {\let\@makecaption\@makecaptiontable\@float{table}}
               {\end@float}

\renewenvironment{table*}
               {\let\@makecaption\@makecaptiontable\@dblfloat{table}}
               {\end@dblfloat}
									
%% Figure Font-sizes
\def\figurelabelfont{\color{BlueTextColor}\bfseries\fontsize{8bp}{11bp}\selectfont}
\def\figurecaptionfont{\fontsize{8bp}{11bp}\selectfont\raggedright}
%% Table point sizes
\def\tablelabelfont{\fontfamily{\rmdefault}\fontsize{9bp}{11bp}\selectfont}
\def\tablecaptionfont{\fontfamily{\rmdefault}\fontsize{8bp}{10bp}\selectfont}
\def\tablebodyfont{\fontsize{7.5bp}{10bp}\selectfont}
\def\tablecolheadfont{\fontsize{7.5bp}{10bp}\bfseries\selectfont}
\def\tablefootnotefont{\fontsize{8bp}{10bp}\selectfont}

%% Figures caption
\newbox\figcaptionbox
\newbox\captionbox
\long\def\@figurecaption#1#2{%
{\setbox\captionbox\hbox{#2}%
 \setbox\figcaptionbox\vbox{\raggedright{\figurelabelfont#1}\figurecaptionfont#2\strut\par}
 {{\figurelabelfont#1}\quad\figurecaptionfont#2\strut\par}}}
\def\figsource#1{\fontsize{8bp}{9.5bp}\selectfont#1\par}
\def\LT@makecaption#1#2#3{%
  \LT@mcol\LT@cols c{\hbox to\z@{\hss\parbox[t]\LTcapwidth{%
    \sbox\@tempboxa{{\figurelabelfont#1{#2}}\space\figurecaptionfont#3}%
    \ifdim\wd\@tempboxa>\hsize
      {\figurelabelfont#1{#2}}\enspace\figurecaptionfont#3%
    \else
      \hbox to\hsize{\box\@tempboxa\hfil}%
    \fi
    \endgraf\vskip\baselineskip}%
  \hss}}}
%% Table Caption
\long\def\@tablecaption#1#2{{{\tablelabelfont#1.}\enspace\tablecaptionfont#2\strut}}

%\renewcommand{\processfigure}[3]{{#1}\par\raggedright\caption{\@figuretitle}#2\par\vskip1pt\vskip-\baselineskip{\@figurenote}#3\vskip0pt\vskip-6pt\vskip0pt}
\renewcommand{\unnumberedfigure}[3]{\centerline{#1}\par{#2}\par{#3}}
\renewcommand{\processscheme}[3]{\centerline{#1}\par\caption{#2}\if!#3!\relax\else\par\figsource{#3}\fi}
\renewcommand{\unnumberedscheme}[3]{\centerline{#1}\par{#2}\par{#3}}

%% Top rule
\def\toprule{\noalign{\vskip2.75pt}
\noalign{\ifnum0=`}\fi
  \hrule \@height -2.9\p@ \@width 0pt
  \hrule \@height 1\p@ % <- rule height
  \hrule \@height 1pt \@width 0pt
  \futurelet\@tempa\@xhline}
%% Middle rule
\def\midrule{\noalign{\ifnum0=`}\fi%
  \hrule \@height 0.5pt \@width 0pt
  \hrule \@height .4pt % <- rule height
  \hrule \@height 0.5pt \@width 0pt
  \futurelet \@tempa\@xhline\noalign{\vskip3pt}}
%% Bottom rule
\def\botrule{\noalign{\ifnum0=`}\fi
  \hrule \@height 0.5pt \@width 0pt
  \hrule \@height 1\p@ % <- rule height
  \futurelet\@tempa\@xhline}


\newcommand{\Tabcolhead}[1]{\hbox{\def\break{\cr}\def\arraystretch{}\begin{tabular}[t]{@{}c@{}}#1\end{tabular}}\vspace*{-1pt}}%

\renewcommand{\colhead}[1]{{\tablecolheadfont\color{BlueTextColor}#1}}%


\definecolor{unnumtabshade}{cmyk}{0,0,0,0.15}

\def\subtabcaption#1{{\vspace*{14.5pt}\fontsize{10bp}{11bp}\selectfont\bfseries\raggedright #1\par\vskip3pt}}

\newcommand\unnumberedtablecontinuedhead[3]{{\setbox\temptbox=\hbox{\tablebodyfont{#2}}%
\tempdime\wd\temptbox\@unnumberedtable{\normalfont\textit{Appendix}\,#1}{#2}{#3}{\tempdime}}}

\renewcommand\unnumberedtable[3]{{\setbox\temptbox=\hbox{\tablebodyfont{#2}}%
\tempdime\wd\temptbox\@unnumberedtable{#1}{#2}{#3}{\tempdime}}}
%%
\renewenvironment{@unnumberedtable}[4]{\leftskip12pt%
{\let\toprule\hline\let\midrule\hline\let\botrule\hline%
\begin{minipage}{\tempdime}
%\caption
{\if!#1!\vskip-14\p@\else\fontsize{10bp}{11bp}\selectfont\bfseries #1\strut\fi}
\end{minipage}\par\addvspace{6\p@}
\vskip1\p@{\fontsize{10bp}{12bp}\selectfont%
{\vspace*{-.5pc}#2%
\vskip2pt%
\noindent%
}%
{\fontsize{10bp}{12bp}\selectfont\begin{minipage}{\tempdime}
#3\strut\end{minipage}%
\par\if!#3!\vskip-12\p@\fi}}%
}%
\box4}%
{\relax}%

\def\quoteauthor#1{{\par\raggedleft\itshape#1\par}}

\renewenvironment{quote}
               {\let\author\quoteauthor\list{}{\raggedright\fontsize{9bp}{13bp}\selectfont\topsep=13.5pt\parskip=0pt\listparindent=0pt\parsep=0pt\leftmargin=11pt\rightmargin=11pt}%
                \item\relax}
               {\endlist}

%% Acknowledgements
\renewenvironment{acknowledgements}[1][]{\begingroup\section*{#1}%
}{\par\endgroup}

\newenvironment{fundinginfo}[1][]{\begingroup\section*{#1}%
}{\par\endgroup}


			   %% References
%% For Author Year representations

%\RequirePackage{natbib}

\newcommand{\customfootnotetext}[2]{{% Group to localize change to footnote
\renewcommand{\thefootnote}{#1}% Update footnote counter representation
\footnotetext[0]{#2}}}% Print footnote text
%

\RequirePackage[sort&compress]{natbib}


\renewenvironment{authorbiography}{\begingroup\addvspace{11pt}\fontsize{9bp}{11bp}\selectfont\noindent\ignorespaces}{\par\endgroup}



\def\bibliographyhead#1{\section*{#1}\vspace*{2pt}}
\setlength{\bibhang}{16pt}

%% For Author Year representations
%\RequirePackage{natbib}
\renewenvironment{thebibliography}[1]{%
\def\bibfont{\fontsize{8bp}{13bp}\selectfont}
\hangindent16pt
\bibliographyhead{\refname}
 %\bibsection
 \parindent\z@
 \bibpreamble
 \bibfont

 \list{\@biblabel{\the\c@NAT@ctr}}{\@bibsetup{#1}\global\c@NAT@ctr\z@}%
 \leftmargin=22pt\itemsep0pt%\leftmargin16pt\itemindent-12pt
 \ifNAT@openbib
   \renewcommand\newblock{\par}%
 \else
   \renewcommand\newblock{\hskip .11em \@plus.33em \@minus.07em}%
 \fi
 \sloppy\clubpenalty4000\widowpenalty4000
 \sfcode`\.\@m
 \let\NAT@bibitem@first@sw\@firstoftwo
    \let\citeN\cite \let\shortcite\cite
    \let\citeasnoun\cite
\raggedright}{%
 \bibitem@fin
 \bibpostamble
 \def\@noitemerr{%
  \PackageWarning{natbib}{Empty `thebibliography' environment}%
 }%
 \endlist
 \bibcleanup
}%
\renewenvironment{thebibliography*}{\begin{thebibliography}}{\end{thebibliography}}


%% For bulleted and others
\def\tabitemargs{%
   \leftmargini \parindent%
   \topsep6pt%
   \partopsep     \z@%
   \itemsep       \z@%
   \parsep        \z@%
   \labelsep      4.5pt%
   \rightmargin   \z@%
   %\raggedright%
   \listparindent \parindent%
   \itemindent    \z@}%
\renewcommand\labelitemi{\textbullet}
\renewcommand\labelitemii{\textendash}
\def\tabitemize{%
   \@ifnextchar[{\@tabitemize}{\@tabitemize[$\bullet$]}}
\def\@tabitemize[#1]{\par%
     \ifnum \@itemdepth >3 \@toodeep\else
     \advance\@itemdepth \@ne
     \edef\@itemctr{item\romannumeral\the\@itemdepth}
     \list{\csname label\@itemctr\endcsname}{%
       \fontsize{10bp}{12bp}\selectfont\tabitemargs
       \setlength{\leftmargin}{\csname leftmargin\romannumeral\the\@itemdepth\endcsname}
       \settowidth\labelwidth{#1}
       \leftmargin11pt
       \addtolength{\leftmargin}{\labelwidth}
       \addtolength{\leftmargin}{\labelsep}
       \def\makelabel##1{\hss \llap{##1}}}%
     \fi
   }
\let\endtabitemize\endlist


\renewenvironment{unenumerate}
               {\list{}{\topsep-0pt\leftmargin12pt\parsep=2pt\itemindent-12pt\fontsize{9bp}{12bp}\selectfont}%
                \item\relax}
               {\endlist}


\long\def\@makecaption#1#2{\raggedright%
\begingroup\parindent\z@%
\par\removelastskip\nointerlineskip\vspace*{8.5bp}\nointerlineskip%
\sbox\@tempboxa{\raggedright{\figurelabelfont#1}\space{\figurecaptionfont#2}}%
\ifdim \wd\@tempboxa >\hsize%
{{\figurelabelfont\color{BlueTextColor}#1}}\space{\figurecaptionfont#2\vphantom{Ay}\par}%
\else%
\global \@minipagefalse%
\hb@xt@\hsize{\box\@tempboxa}%
\fi%
\vskip\belowcaptionskip%
\endgroup}

\long\def\@makecaptiontable#1#2{%
\begingroup\parindent\z@%
\par\removelastskip\nointerlineskip\vspace*{6bp}\nointerlineskip%
\sbox\@tempboxa{\fontsize{9bp}{11bp}\selectfont{#1:}{\hspace*{7.5pt}}#2\vphantom{Ay}}%
\ifdim \wd\@tempboxa >\hsize%
{\bfseries\color{BlueTextColor}\fontsize{9bp}{11bp}\selectfont#1} \tablecaptionfont{#2}\vphantom{Ay}\par%
\else%
\global \@minipagefalse%
{{\fontsize{8bp}{11bp}\selectfont\bfseries\color{BlueTextColor}#1}} \tablecaptionfont{#2}\vphantom{Ay}\par%
%\hb@xt@\hsize{\box\@tempboxa\hfill}%
\fi%
\vskip\belowcaptionskip%
\endgroup}

	  %% Appendix

\def\appendixhead{\section{APPENDIX}}
\renewcommand{\appendix}{\let\enumerate\appenumerate\let\itemize\appitemize%
\@appendixtrue
\if@appendix
\setcounter{section}{0}
\setcounter{figure}{0}
\setcounter{table}{0}
\setcounter{equation}{0}
\def\thesection{A.\arabic{section}}
\def\thefigure{A.\arabic{figure}}
\def\tablename{APPENDIX.\ }
\def\thetable{\hskip-14pt}
\def\theequation{A.\arabic{equation}}
\fi}

\def\appenumargs{%
   \leftmargini \parindent%
   \topsep 6pt%
   \partopsep     \z@%
   \itemsep       \z@%
   \parsep        \z@%
   \labelsep      .6em%
   \rightmargin   \z@%
   \listparindent \parindent%
   \itemindent    \z@}%

\def\appenumerate{%
    \@ifnextchar[{\@appnumerate}{\@appnumerate[0.]}}

\def\@appnumerate[#1]{\par%
     \ifnum \@enumdepth >3 \@toodeep\else
     \advance\@enumdepth \@ne
     \edef\@enumctr{enum\romannumeral\the\@enumdepth}
     \list{\csname label\@enumctr\endcsname}{%
       \fontsize{9}{12}\selectfont\appenumargs%
       \setlength{\leftmargin}{\csname leftmargin\romannumeral\the\@enumdepth\endcsname}
       \usecounter{\@enumctr}
       \settowidth\labelwidth{#1}
       \leftmargin0pt
       \addtolength{\leftmargin}{\labelwidth}
       \addtolength{\leftmargin}{\labelsep}
       \def\makelabel##1{\hss\llap{##1}}}%
     \fi
   }
\let\endappenumerate\endlist


\def\appitemargs{%
   \leftmargini \parindent%
   \ifnum \@enumdepth>0\topsep0pt\else\topsep6pt\fi%
   \partopsep     \z@%
   \itemsep       \z@%
   \parsep        \z@%
   \labelsep      4.5pt%
   \rightmargin   \z@%
   %\raggedright%
   \listparindent \parindent%
   \itemindent    \z@}%
\renewcommand\labelitemi{\textbullet}
\renewcommand\labelitemii{\textendash}
\def\appitemize{%
   \@ifnextchar[{\@appitemize}{\@appitemize[$\bullet$]}}
\def\@appitemize[#1]{\par%
     \ifnum \@itemdepth >3 \@toodeep\else
     \advance\@itemdepth \@ne
     \edef\@itemctr{item\romannumeral\the\@itemdepth}
     \list{\csname label\@itemctr\endcsname}{%
       \fontsize{9bp}{12bp}\selectfont\appitemargs
       \setlength{\leftmargin}{\csname leftmargin\romannumeral\the\@itemdepth\endcsname}
       \settowidth\labelwidth{#1}
       \leftmargin3pt
       \addtolength{\leftmargin}{\labelwidth}
       \addtolength{\leftmargin}{\labelsep}
       \def\makelabel##1{\hss \llap{##1}}}%
     \fi
   }
\let\endappitemize\endlist



\def\toctitle#1#2{\thispagestyle{empty}\contentsline {chaptertitle}{\numberline {}#1}{#2}}

\def\tocauthor#1#2{\contentsline {chapterauthor}{\numberline {}#1}{}}

\def\journaltitle#1{{\vspace*{-17.6pt}{\centering{\fontsize{33}{35}\selectfont\bfseries\noindent#1\par}}
\removelastskip\nointerlineskip\vspace*{22.5pt}\nointerlineskip
\centering Volume \@jvol, Number \@jissue, \@jyear
\removelastskip\nointerlineskip\vspace*{9pt}\nointerlineskip
\rule{\textwidth}{.5pt}
\removelastskip\nointerlineskip\vspace*{3.1pt}\nointerlineskip}}

\renewcommand{\arraystretch}{1.29}

\renewenvironment{jnleditorialpage}
               {\hbox{
	       }\vfil\list{}{\thispagestyle{empty}\fontsize{9}{10.25}\selectfont\rightmargin0pt%
               \leftmargin0pt\listparindent0pt}%
                \item\relax}
               {\endlist\pagebreak}

\renewenvironment{titlepage}{\begingroup%\vskip12pt%
\thispagestyle{empty}%
%\jnltitle{Violence and Victims}%
}{\endgraf}

\renewcommand{\tochead}[1]{{\vskip13pt\centering\fontfamily{\rmdefault}\fontsize{11bp}{12bp}\selectfont\bfseries#1\vspace*{14pt}\par}}
\renewcommand{\toctitle}[2]{{\parbox[b]{330pt}{\raggedright\fontsize{10bp}{12bp}\selectfont\hangindent12pt#1\strut\par}}\hfill#2\strut\vspace*{-4pt}\nopagebreak\par}
\renewcommand{\tocauthor}[2]{{\hspace*{24pt}\parbox[b]{306pt}{\raggedright\fontsize{10bp}{12bp}\selectfont\itshape#1\strut\par}}\hfill#2\strut\vspace*{8.75pt}\par}

\def\jnltitle#1{{\vspace*{-20pt}{\centering{\fontsize{33}{35}\selectfont\bfseries\noindent#1\par}}
\removelastskip\nointerlineskip\vspace*{22.5pt}\nointerlineskip
\centering Volume \@jvol, Number \@jissue, \@jyear
\removelastskip\nointerlineskip\vspace*{9pt}\nointerlineskip
\rule{\textwidth}{.5pt}
\removelastskip\nointerlineskip\vspace*{3.1pt}\nointerlineskip}}

\def\noteshead{\section*{Notes\vspace*{0pt}}}


\renewcommand{\tocauthor}[2]{{\parbox[b]{\textwidth}{\raggedright\hangafter0\hangindent24pt\itshape#1\strut\par}}\hfill\strut\vspace{8.75pt}\par}

\let\biography\authorbiography
\let\endbiography\endauthorbiography

\renewenvironment{sidewaystable*}
               {\sidetabtrue\let\@makecaption\@makecaptiontable\@rotdblfloat{table}}
               {\thisfloatpagestyle{headings}\end@rotdblfloat}

\renewenvironment{sidewaystable}
               {\sidetabtrue\let\@makecaption\@makecaptiontable\@rotdblfloat{table}}
               {\thisfloatpagestyle{headings}\end@rotdblfloat\sidetabfalse}

\newenvironment{sidewaystableone}
               {\sidetabtrue\def\tablefootnotefont{\fontsize{7pt}{9pt}\selectfont}\let\@makecaption\@makecaptiontable\@rotdblfloat{table}}
               {\end@rotdblfloat}


%% For Endnotes
\def\enotesize{\fontsize{9bp}{11bp}\selectfont}
\def\@makeenmark{\hbox{\@textsuperscript{\fontsize{6.12bp}{6.12bp}\selectfont\@theenmark}}}%
\def\@openenotes{\immediate\openout\@enotes=\jobname.ent\relax
      \global\@enotesopentrue}
\long\def\addtoendnotes#1{%
     \if@enotesopen \else \@openenotes \fi
     \begingroup
     \parindent0pt%
        \newlinechar='40
        \let\protect\string
        \immediate\write\@enotes{#1\if@nobreak\else\vskip12pt\fi}%
     \endgroup}
\def\notesname{\ifnum\theendnote>1 NOTES \else NOTE\fi}%
\def\enoteheading{\section*{\notesname}%
  \mbox{}\par\vskip0pt\vskip-\baselineskip}
\def\enoteformat{\rightskip\z@ \leftskip\z@ \parindent=0pt%
  \leavevmode\hb@xt@24.5pt{\hss\llap{\@theenmark.\hskip4pt}}}%DT
%\def\enoteformat{\rightskip\z@ \leftskip\z@ \parindent=0pt
%  \leavevmode\@hangfrom{{\hbox to 18pt{\hss\@theenmark.\hskip5.4pt}}}}
\def\theendnotes{\immediate\closeout\@enotes \global\@enotesopenfalse%
  \begingroup
    \makeatletter
    \edef\@tempa{`\string >}%
    \ifnum\catcode\@tempa=12%
      \let\@ResetGT\relax
    \else
      \edef\@ResetGT{\noexpand\catcode\@tempa=\the\catcode\@tempa}%
      \@makeother\>%
    \fi
    \def\@doanenote##1##2>{\def\@theenmark{##1}\par\begingroup
        \@ResetGT
        \edef\@currentlabel{\csname p@endnote\endcsname\@theenmark}%
        \enoteformat}
    \def\@endanenote{\par\endgroup}%
    \enoteheading
    \enotesize
    \input{\jobname.ent}%
      \endgroup}

\newcounter{endnotecnt}%
\def\theendnotecnt{\arabic{endnotecnt}}%


%\newcommand{\noteshead}[1]{\section*{#1\vspace*{6pt}}}
\def\notesenumargs{%
   \footnotesize%
   \leftmargini \parindent%
   \topsep 6pt%
   \partopsep     \z@%
   \itemsep       \z@%
   \parsep        \z@%
   \labelsep      .5em%
   \rightmargin   \z@%
   \listparindent \parindent%
   \itemindent    24pt}%

\def\endnotes{%
    \@ifnextchar[{\@nnumerate}{\@nnumerate[0.]}}

\def\noteshead{\section*{\ifnum\theenumi>1 Notes\else Notes\fi}}%
\def\@nnumerate[#1]{\par\noteshead%
     \ifnum \@enumdepth >3 \@toodeep\else
     \advance\@enumdepth \@ne
     \edef\@enumctr{enum\romannumeral\the\@enumdepth}
     \list{\csname label\@enumctr\endcsname}{%
       \notesenumargs\fontsize{9}{11}\selectfont%
       \setlength{\leftmargin}{\csname leftmargin\romannumeral\the\@enumdepth\endcsname}
       \usecounter{\@enumctr}
       \settowidth\labelwidth{#1}
       \leftmargin0pt
%       \addtolength{\leftmargin}{\labelwidth}
 %      \addtolength{\leftmargin}{\labelsep}
       \def\makelabel##1{\hss\llap{##1}}}%
     \fi
   }
\let\endendnotes\endlist



\newcommand{\mydropcap}[1]{\vskip5pt\noindent\parbox[t]{48pt}{\smash{\llap{\raisebox{-23pt}{\fontsize{48}{48}\selectfont #1}}}}\hangindent54pt\hangafter-3{}}


\newenvironment{COI}[1]{\begingroup\parindent=0pt\vskip12pt}{\vskip12pt\clearpage\endgroup}


\def\textbackslashtextsim{$\sim$}

\definecolor{thirtypercentblack}{cmyk}{0,0,0,0.3}
\definecolor{fiftypercentblack}{cmyk}{0,0,0,0.5}

\newcommand*\wrapletters[1]{\wr@pletters#1\@nil}
\def\wr@pletters#1#2\@nil{#1\allowbreak\if&#2&\else\wr@pletters#2\@nil\fi}


\RequirePackage[nohints]{minitoc}
\AtEndDocument{\faketableofcontents}


%\def\frontmatter{\pagestyle{empty}\let\section\jnltitle}
\def\frontmatter{}

\def\Tvspace#1{\gdef\@Tvspace{#1}}\gdef\@Tvspace{}
\def\Bvspace#1{\gdef\@Bvspace{#1}}\gdef\@Bvspace{}
\def\Lhspace#1{\gdef\@Lhspace{#1}}\gdef\@Lhspace{}
\def\Rhspace#1{\gdef\@Rhspace{#1}}\gdef\@Rhspace{}

\newbox\mybox
\newif\ifsidetab%
\sidetabfalse%

%\long\def\tabuprocesstable#1#2#3{
\renewcommand\processtable[3]{
\begingroup\parindent0pt%\renewcommand{\arraystretch}{1.85}%
\ifx\@Tvspace\empty\else\vspace*{\@Tvspace}\fi%
\setbox\mybox\hbox{{\tablebodyfont#1}}%
%\def\@captype{table}
\let\enumerate\tenumerate
\let\endenumerate\endtenumerate
 \begin{minipage}{\wd\mybox}%
\vbox{\tablebodyfont#1}\par\nointerlineskip\vskip0pt\nointerlineskip%
\ifx!#2!\else#2\vspace*{3pt}\fi%
\vbox{\tablefootnotefont#3}%
\end{minipage}
%\end{center}%
\ifx\@Rhspace\empty\else\hspace*{\@Rhspace}\fi%
\ifx\@Bvspace\empty\else\vspace*{\@Bvspace}\fi%
\gdef\@Bvspace{}\gdef\@Tvspace{}\gdef\@Lhspace{}\gdef\@Rhspace{}%
\endgroup%
}

\def\@makefnmark{{\textsuperscript{\normalfont\@thefnmark}}}

\renewcommand\@makefntext[1]{{\def\newline{\par}%
    \fontsize{8bp}{10bp}\selectfont
    {{{\textsuperscript{\@thefnmark}}}}{#1}\par}}

\newlist{orgenumerate}{enumerate}{10}
\setlist[orgenumerate,1]{label={\arabic*},format={\color{BlueTextColor}\bfseries},labelsep=5.0bp,leftmargin=*,align=right,widest=9.,
labelindent=0pt,itemsep=0pt,topsep=13bp,parsep=0pt,partopsep=0pt,rightmargin=0pt,listparindent=0pt,before={\raggedright},
%font={\rmfamily\normalfont\fontsize{9bp}{13bp}\selectfont},%before={\fontsize{9bp}{12bp}\selectfont}
}

\setlist[orgenumerate,2]{label={\arabic*},labelsep=5bp,leftmargin=*,align=left,widest=9.,
labelindent=0pt,itemsep=0pt,topsep=0bp,parsep=0pt,partopsep=0pt,rightmargin=0pt,listparindent=0pt,
%font={\fontsize{9bp}{12bp}\selectfont},before={\fontsize{9bp}{12bp}\selectfont}
}

\setlist[orgenumerate,3]{label={\arabic*},labelsep=5bp,leftmargin=*,align=left,widest=9.,
labelindent=0pt,itemsep=0pt,topsep=0bp,parsep=0pt,partopsep=0pt,rightmargin=0pt,listparindent=15pt,
%font={\fontsize{9bp}{12bp}\selectfont},before={\fontsize{9bp}{12bp}\selectfont}
}

\setlist[itemize,1]{label={\textbullet},format={\color{BlueTextColor}\bfseries},labelsep=8bp,leftmargin=*,align=left,labelindent=0pt,
itemsep=0pt,itemindent=0pt,topsep=13bp,parsep=0pt,partopsep=0pt,rightmargin=0pt,listparindent=15pt,before={\raggedright},
%font={\fontsize{9bp}{12bp}\selectfont},before={\fontsize{9bp}{12bp}\selectfont}
}

\setlist[itemize,2]{label={\textendash},labelsep=8bp,leftmargin=*,align=left,labelindent=0pt,
itemsep=0pt,topsep=0bp,parsep=0pt,partopsep=0pt,rightmargin=0pt,listparindent=0pt,
%font={\fontsize{9bp}{12bp}\selectfont},before={\fontsize{9bp}{12bp}\selectfont}
}

\newlist{enumitemize}{itemize}{10}
\setlist[enumitemize,1]{label={\textbullet},labelsep=-3.5bp,leftmargin=27.5pt,align=left,
itemsep=0pt,topsep=0bp,parsep=0pt,partopsep=0pt,rightmargin=0pt,listparindent=0pt,
%font={\fontsize{9bp}{12bp}\selectfont},before={\fontsize{9bp}{12bp}\selectfont}
}

\setlist[enumitemize,2]{label={\textbullet},labelsep=9bp,leftmargin=*,align=left,
itemsep=0pt,topsep=0bp,parsep=0pt,partopsep=0pt,rightmargin=0pt,listparindent=0pt,
%font={\fontsize{9bp}{12bp}\selectfont},before={\fontsize{9bp}{12bp}\selectfont}
}


\newlist{tenumerate}{enumerate}{10}
\setlist[tenumerate,1]{label={\arabic*},labelsep=5.0bp,leftmargin=*,align=right,widest=9.,
labelindent=0pt,itemsep=0pt,topsep=0bp,parsep=0pt,partopsep=0pt,rightmargin=0pt,listparindent=0pt,
%font={\fontsize{9bp}{12bp}\selectfont},before={\fontsize{9bp}{12bp}\selectfont}
}

\setlist[tenumerate,2]{label={\arabic*},labelsep=6bp,leftmargin=*,align=right,widest=9.,
labelindent=0pt,itemsep=0pt,topsep=0bp,parsep=0pt,partopsep=0pt,rightmargin=0pt,listparindent=0pt,
%font={\fontsize{9bp}{12bp}\selectfont},before={\fontsize{9bp}{12bp}\selectfont}
}

\setlist[tenumerate,3]{label={\arabic*},labelsep=6bp,leftmargin=*,align=right,widest=9.,
labelindent=0pt,itemsep=0pt,topsep=6bp,parsep=0pt,partopsep=0pt,rightmargin=0pt,listparindent=0pt,
%font={\fontsize{9bp}{12bp}\selectfont},before={\fontsize{9bp}{12bp}\selectfont}
}

\newlist{unnumberlist}{enumerate}{10}
\setlist[unnumberlist,1]{label={},labelsep=0bp,leftmargin=*,align=right,
labelindent=0pt,itemsep=0pt,topsep=13bp,parsep=0pt,partopsep=0pt,rightmargin=0pt,listparindent=0pt,
font={\fontsize{9bp}{11bp}\selectfont},}

\newlist{enumunnumberlist}{enumerate}{10}
\setlist[enumunnumberlist,1]{label={},labelsep=0bp,leftmargin=12pt  ,align=right,
labelindent=0pt,itemsep=0pt,topsep=0bp,parsep=0pt,partopsep=0pt,rightmargin=0pt,listparindent=0pt,
font={\fontsize{10bp}{12bp}\selectfont},before={\fontsize{10bp}{12bp}\selectfont}}



\renewenvironment{enumerate}[1][]
{\begingroup\begin{orgenumerate}[#1]
\let\unnumberlist\enumunnumberlist
\let\endunnumberlist\endenumunnumberlist
\let\itemize\enumitemize
\let\enditemize\endenumitemize}
{\end{orgenumerate}\endgroup}

\def\eissn#1{}
%\def\keysep#1{\!#1}
\def\keysep#1{#1}

%%\cmidrulewidth=0.5pt%

%%\aboverulesep=-\arrayrulewidth%
%%\belowrulesep=-5pt%

\let\newtabucline\cmidrule\arrayrulecolor{BlueTextColor}
\usepackage{tfrupee}


\newlist{noteenumerate}{enumerate}{10}
\setlist[noteenumerate,1]{label={\arabic*.},labelsep=2.0pt,
leftmargin=*,itemsep=3pt,topsep=0pt,align=left,
labelindent=-0pt,labelwidth=0bp,parsep=0pt,partopsep=0pt,rightmargin=0pt,itemindent=0pt,
font={\color{BlueTextColor}\fontsize{7bp}{9bp}\selectfont},first*={\fontsize{7bp}{9bp}\selectfont},}

%
\newenvironment{Endnotes}
{\bgroup%
\let\enumerate\noteenumerate%
\let\endenumerate\endnoteenumerate%
}%
{\egroup}


\newlist{newappenumerate}{enumerate}{10}
\setlist[newappenumerate,1]{label={\arabic*},labelsep=5.0bp,leftmargin=*,align=right,widest=9.,
labelindent=32pt,itemsep=0pt,topsep=6bp,parsep=0pt,partopsep=0pt,rightmargin=0pt,listparindent=0pt,
font={\fontsize{8bp}{10bp}\selectfont},before={\fontsize{8bp}{10bp}\selectfont}
}

\setlist[newappenumerate,2]{label={\arabic*},labelsep=6bp,leftmargin=*,align=right,widest=9.,
labelindent=0pt,itemsep=0pt,topsep=6bp,parsep=0pt,partopsep=0pt,rightmargin=0pt,listparindent=0pt,
font={\fontsize{8bp}{10bp}\selectfont},before={\fontsize{8bp}{10bp}\selectfont}
}


\newenvironment{newappendix}{\let\enumerate\newappenumerate\let\endenumerate\endnewappenumerate\begingroup\fontsize{8bp}{10bp}\selectfont}{\endgroup}

\def\ps@removeheader{%
  \let\@mkboth\@gobbletwo\let\@oddhead\@empty\let\@oddfoot\@empty
  \let\@evenhead\@empty\let\@evenfoot\@empty}

\newenvironment{sketch}[1][]{\begingroup\addvspace{6.5pt}\noindent\fontsize{10bp}{12bp}\selectfont{\bfseries#1}\space}{\hfill$\square$\endgroup\par\addvspace{6.5pt}}

\theoremstyle{theorem}
\newtheorem{theorem}{Theorem}[section]
\newtheorem{THM}{Theorem}[section]
\newtheorem{lem}[theorem]{Lemma}
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{lemma2}[theorem]{Lemma*}
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{claim}[theorem]{Claim}
\newtheorem{conjecture}[theorem]{Conjecture}
\newtheorem{prop}[theorem]{Proposition}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{remark}[theorem]{Remark}
\newtheorem{fact}[theorem]{Fact}
\newtheorem{definition}[theorem]{Definition}

%\newtheorem{sconjecture}[stheorem]{Conjecture}
%\newtheorem{sproposition}[stheorem]{Proposition}

\theoremstyle{definition}
\newtheorem{case}[theorem]{Terminology}
\newtheorem{term}[theorem]{Terminology}
\newtheorem{hackconstruction}[theorem]{Construction}
\newtheorem{definition2}[theorem]{Definition*}
\newtheorem{context}[theorem]{Context}
\newtheorem{conditions}[theorem]{Conditions}
\newtheorem{observation}[theorem]{Observation}
\newtheorem{observation1}[theorem]{Observation}
\newtheorem{notation}[theorem]{Notation}
\newtheorem{example2}[theorem]{Example*}
\newtheorem{hypothesis}[theorem]{Hypothesis}
\newtheorem{construction}[theorem]{Construction}
\newtheorem{conclusion}[theorem]{Conclusion}
\newtheorem{problem}[theorem]{Problem}
\newtheorem{question}[theorem]{Question}
%variants for chapters with subsections
\newtheorem{stheorem}{Theorem}[subsection]
\newtheorem{scorollary}[stheorem]{Corollary}
\newtheorem{slemma}[stheorem]{Lemma}
\newtheorem{sdefinition}[stheorem]{Definition}
\newtheorem{sclaim}[stheorem]{Claim}
\newtheorem{sconstruction}[stheorem]{Construction}
\newtheorem{sfact}[stheorem]{Fact}
\newtheorem{sremark}[stheorem]{Remark}
\newtheorem{squestion}[stheorem]{Question}
\newtheorem{sassumption}[stheorem]{Assumption}
\newtheorem{sobservation}[stheorem]{Observation}
\newtheorem{snotation}[stheorem]{Notation}
\newtheorem{sexample}[stheorem]{Example}
\newtheorem{sexercise}[stheorem]{Exercise}
\newtheorem{sapp}[stheorem]{Applications}
\newtheorem{convention}[theorem]{Convention}
\newtheorem{subclaim}[theorem]{Subclaim}
\newtheorem{terminology}[theorem]{Terminology}
\theoremstyle{plain}


\newtheoremstyle{remark}% name of the style to be used
{}% measure of space to leave above the theorem. E.g.: 3pt
{}% measure of space to leave below the theorem. E.g.: 3pt
{\normalfont}% name of font to use in the body of the theorem
{}% measure of space to indent
{\itshape}% name of head font
{}% punctuation between head and body
{ }% space after theorem head; " " = normal interword space
{\thmnote{#3}.}

\theoremstyle{remark}
\newtheorem{example}[theorem]{Example}
\newtheorem{assumption}[theorem]{Assumption}

\newtheoremstyle{algm}% name of the style to be used
{}% measure of space to leave above the theorem. E.g.: 3pt
{}% measure of space to leave below the theorem. E.g.: 3pt
{\normalfont}% name of font to use in the body of the theorem
{}% measure of space to indent
{\itshape}% name of head font
{}% punctuation between head and body
{ }% space after theorem head; " " = normal interword space
{\thmnote{#3}.\\}
\theoremstyle{algm}
\newtheorem{algm}[theorem]{Algorithm}


%\if@ProofPDF
%\else
%\@page@linenumberfalse
%\fi

\renewcommand{\query}[2][0pt]{{\marginnote{\vspace*{#1}\\[-12pt] \checkoddpage\ifoddpage\hspace*{90pt}\else\hspace*{600pt}\fi\hspace*{\@queryspace}{\parbox{40pt}{\color{black}\fontsize{7bp}{8bp}\selectfont\raggedright#2}}}}\gdef\@queryspace{0pt}}

\newbox\figboxa
\newdimen\figwdth


\renewcommand{\processfigure}[3]{\vspace*{1pt}
\def\@captype{figure}%
\setbox\figboxa\hbox{#1}%
\figwdth=\wd\figboxa
%\centering%
\ifx\@Lhspace\@empty\else\hspace*{\@Lhspace}\fi%
\begin{minipage}[t]{\hsize}\ifx\@Tvspace\@empty\else\vspace*{\@Tvspace}\fi%
{\centering#1\par}%
\nopagebreak\removelastskip\nointerlineskip\vspace{1pt}\nopagebreak%
\ifx!#2!\else#2\fi%
%\ifx\@figuretitle\empty\else{\caption[]{\@figuretitle#2}}\fi%
\if!#3!\relax\else\parbox{\figwdth}{#3\par}\fi%\nopagebreak\removelastskip\nointerlineskip\nopagebreak
\if!\@figuresource!\else{\fontsize{8bp}{11bp}\selectfont\@figuresource\par}\fi%\@figurenote\par
\end{minipage}\ifx\@Rhspace\@empty\else\hspace*{\@Rhspace}\fi%
\ifx\@Bvspace\@empty\else\vspace*{\@Bvspace}\fi
\gdef\@figuretitle{}\gdef\@figuresubtitle{}\gdef\@figuresource{}\gdef\@figurenote{}\gdef\@Tvspace{}\gdef\@Bvspace{}\gdef\@Lhspace{}\gdef\@Rhspace{}\gdef\@capwidth{\figwdth}}

%\let\versoheadtop\authormark

\def\refhead#1{\vspace*{15pt}\centerline{\fontsize{8bp}{10bp}\selectfont{#1}}\par\vspace*{10.5pt}}%

%%%Remove paren around equation number
\renewcommand\tagform@[1]{\maketag@@@{\ignorespaces#1\unskip\@@italiccorr}}


\def\linenumberfont{\normalfont\fontsize{9bp}{9bp}\selectfont}


\newcommand\stepitem[2][]{{\addvspace{6pt}\par\noindent\textbf{#1}\space}}

\newenvironment{steplist}[1][\relax]{\addvspace{6pt}\begingroup\let\item\stepitem}{\endgroup\addvspace{6pt}}

\renewenvironment{description}[1][\relax]{\addvspace{6pt}\begingroup\let\item\stepitem}{\endgroup\addvspace{6pt}}

\DeclareRobustCommand*{\yyyymmdddate}{%
\renewcommand*{\formatdate}[3]{%
\@day=##1\relax\@month=##2\relax\@year=##3\relax
\@dtctr=\@year\dateseparator \twodigit\@month\dateseparator
\@dtctr=\@year
%
}}


\usepackage[mmddyyyy]{datetime}

\def\twodigits[#1]{\ifnum#1<10 0\the#1\else\ifnum#1>100 \twodigits[\numexpr#1-100]\relax\else\the#1\fi\fi}

\DeclareRobustCommand*{\today}{\formatdate{\day}{\month}{\twodigits[\year]}}

\renewcommand{\dateseparator}{/}

\renewenvironment{extract}
               {\list{}{\topsep=13pt\parsep=123pt\listparindent=0pt\leftmargin=12pt\rightmargin=12pt}%
                \item\relax}
               {\endlist}


\usepackage{atbegshi}


\newenvironment{history}{}{}
\def\receivedday#1{{#1\space}}
\def\receivedmonth#1{{#1\space}}
\def\receivedyear#1{{#1}}
\def\acceptedday#1{{#1\space}}
\def\acceptedmonth#1{{#1\space}}
\def\acceptedyear#1{{#1}}
\def\revisedday#1{{#1\space}}
\def\revisedmonth#1{{#1\space}}
\def\revisedyear#1{{#1}}
\def\submittedday#1{{#1\space}}
\def\submittedmonth#1{{#1\space}}
\def\submittedyear#1{{#1}}
\def\publishedday#1{{#1\space}}
\def\publishedmonth#1{{#1\space}}
\def\publishedyear#1{{#1}}

\def\received#1{\gdef\@received{#1}}\gdef\@received{}%
\def\revised#1{\gdef\@revised{Revised #1}}\gdef\@revised{}%
\def\accepted#1{\gdef\@accepted{#1}}\gdef\@accepted{}%
\def\published#1{\gdef\@published{#1}}\gdef\@published{}%
\def\submitted#1{\gdef\@submitted{#1}}\gdef\@submitted{}%

\usepackage{cancel}


\let\smalltriangleup\vartriangle


\def\Upgamma{\Gamma}
\def\Uplambda{\Lambda}
\def\Uppi{\Pi}


\def\ldots{\hbox{.\,.\,.\,}}

\def\underTilde#1{{\baselineskip=0pt\vtop{\hbox{$#1$}\hbox{$\sim$}}}{}}

\def\dtscriptsize#1{{\fontsize{7bp}{7bp}\selectfont#1}}

\let\oplus\bigoplus

\let\TextUnderline\underline

\AtBeginDocument{%
    \def\addcontentsline#1#2#3{% toc extension, type, tag
      \begingroup
        \let\label\@gobble
        \ifx\@currentHref\@empty
          \Hy@Warning{%
            No destination for bookmark of \string\addcontentsline,%
            \MessageBreak destination is added%
          }%
          \phantomsection
        \fi
        \expandafter\ifx\csname toclevel@#2\endcsname\relax
          \begingroup
            \def\Hy@tempa{#1}%
            \ifx\Hy@tempa\Hy@bookmarkstype
              \Hy@WarningNoLine{%
                bookmark level for unknown #2 defaults to 0%
              }%
            \else
              \Hy@Info{bookmark level for unknown #2 defaults to 0}%
            \fi
          \endgroup
          \expandafter\gdef\csname toclevel@#2\endcsname{0}%
        \fi
        \edef\Hy@toclevel{\csname toclevel@#2\endcsname}\bgroup\@bookmarkcharacters%
        \Hy@writebookmark{\csname the#2\endcsname}%
          {#3}%
          {\@currentHref}%
          {\Hy@toclevel}%
          {#1}\egroup%
        \ifHy@verbose
          \begingroup
            \def\Hy@tempa{#3}%
            \@onelevel@sanitize\Hy@tempa
            \let\temp@online\on@line
            \let\on@line\@empty
            \Hy@Info{%
              bookmark\temp@online:\MessageBreak
              thecounter {\csname the#2\endcsname}\MessageBreak
              text {\Hy@tempa}\MessageBreak
              reference {\@currentHref}\MessageBreak
              toclevel {\Hy@toclevel}\MessageBreak
              type {#1}%
            }%
          \endgroup
        \fi
        \addtocontents{#1}{%
          \protect\contentsline{#2}{#3}{\thepage}{\@currentHref}%
        }%
      \endgroup
    }}

\gdef\@bookmarkcharacters{%
\def\mathbb##1{{##1}}%
\def\footnote##1{}\def\frac##1##2{##1/##2}\let\tfrac\frac%
\def\textplus{+}\let\boldsymbol\relax%
\def\inlineartwork##1{\relax}%
\let\alpha\textalpha\let\beta\textbeta\let\gamma\textgamma%
\let\delta\textdelta\let\epsilon\textepsilon\let\zeta\textzeta%
\let\eta\texteta\let\theta\texttheta\let\iota\textiota%
\let\kappa\textkappa\let\lambda\textlambda\let\mu\textmugreek%
\let\nu\textnu\let\xi\textxi\let\pi\textpi\let\rho\textrho\let\varsigma\textvarsigma\let\sigma\textsigma%
\let\tau\texttau\let\upsilon\textupsilon\let\phi\textnormalphi\let\varphi\textphi\let\chi\textchi\let\psi\textpsi\let\omega\textomega%
\let\iota\textiota%
\let\tan\texttan%
\let\bullet\textbullet%
\let\tilde\~%
\let\int\textint
\let\times\texttimes
\let\Gamma\textGamma\let\Delta\textDelta\let\Theta\textTheta\let\Lambda\textLambda\let\Xi\textXi\let\Pi\textPi%
\let\Sigma\textSigma\let\Upsilon\textUpsilon\let\Phi\textPhi\let\Psi\textPsi\let\Omega\textOmega\let\varOmega\textOmega%
\let\infty\textinfinity%
\let\neq\textnoteq%
\let\le\textlesserequal%
\let\leq\textlesserequal%
\let\ge\textgreaterequal%
\let\geq\textgreaterequal%
\let\to\textrightarrow
\let\rightarrow\textrightarrow
\let\partial\textpartial%
\let\cdot\textperiodcentered%
\let\rightleftarrows\textrightleftarrows%
\let\underset\textunderset%
\let\sum\textsum%
\let\in\textin%
\def\varepsilon{}
\let\neq\textneq}%

% Page break penalties
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301

% Disallow widows and orphans
\clubpenalty 10000
\widowpenalty 10000

%\usepackage{algorithm}
\usepackage[algo2e, linesnumbered, ruled,vlined]{algorithm2e}
\usepackage{needspace}


\renewcommand{\fnum@algocf}{\AlCapSty{\AlCapFnt\fontsize{7}{9}\selectfont\algorithmcfname\nobreakspace\thealgocf}}%

\renewcommand{\algocf@setcaption}{%
  \ifthenelse{\boolean{algocf@procenvironment}}{% if proc environment, caption text must be changed
    \let\algocf@oldcaptiontext=\algocf@captiontext%
    \renewcommand{\algocf@captiontext}[2]{%
      \algocf@captionproctext{##1}{##2}%
    }%
  }{}%
  \let\algocf@savecaption=\@caption%
  \ifthenelse{\boolean{algocf@procenvironment}}{\let\@caption=\algocf@caption@proc}{\let\@caption=\algocf@caption@algo}%
  \let\algocf@oldmakecaption=\@makecaption%
  \renewcommand{\@makecaption}[2]{%
    \expandafter\csname algocf@makecaption@\algocf@style\endcsname{##1}{\fontsize{7}{9}\selectfont##2}%
  }%
}%

\renewcommand{\algocf@caption@ruled}{\box\algocf@capbox\kern\interspacetitleruled\hrule
  width\algocf@ruledwidth height\algotitleheightrule depth0pt\kern\interspacealgoruled\vspace*{2.25pt}}%


%% Box Styles
\newenvironment{boxtype1}{%
\begin{tcolorbox}[width=\textwidth,colframe=black,colback=white,breakable,%%
                  before skip=10pt plus3pt minus2pt,after skip=10pt plus3pt minus2pt,%%
                  sharp corners,boxsep=4pt,boxrule=0.75pt,left=11pt,right=6pt,top=5pt,fontupper=\normalfont,%%
                  ]%%
                  }%
    {\end{tcolorbox}}
\newcommand{\boxhead}[1]{{\normalfont\fontfamily{\sfdefault}\selectfont\bfseries\noindent#1\strut}\vspace*{4pt}\nopagebreak\par\noindent}

\definecolor{colframecolor2}{cmyk}{0.89,0.87,0.19,0.06}
\definecolor{bgframecolor2}{cmyk}{0.04,0.04,0,0}
\newenvironment{boxtype2}{%
\begin{tcolorbox}[width=\textwidth,colframe=colframecolor2,colback=bgframecolor2,breakable,%%
                  before skip=10pt plus3pt minus2pt,after skip=10pt plus3pt minus2pt,%%
                  boxsep=4pt,boxrule=.5pt,left=10pt,right=10pt,top=4pt,%%
                  ]%%
                  }%
    {\end{tcolorbox}}

%% Story head
\newcommand{\storyhead}[1]{\subsection*{#1\vspace*{-4pt}}}


%\definecolor{BlueTextColor}{cmyk}{0.84,0.65,0.06,0.04}
\definecolor{BlueTextColor}{RGB}{62,87,142}

\definecolor{CyanTextColor}{cmyk}{0.05,0.03,0.02,0}
\definecolor{75black}{cmyk}{0,0,0,0.75}
\definecolor{abstractbg}{RGB}{244,244,244}


\definecolor{white}{cmyk}{0,0,0,0}
\definecolor{black}{cmyk}{0,0,0,1}
\definecolor{10black}{cmyk}{0,0,0,0.10}
\definecolor{15black}{cmyk}{0,0,0,0.20}
\definecolor{20black}{cmyk}{0,0,0,0.30}
\definecolor{70black}{cmyk}{0,0,0,0.70}
\definecolor{50black}{cmyk}{0,0,0,0.50}

%%%%%%%%%%%%%%%%%%%% Highlighting text %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{ulem}

%\definecolor{bluelight}{cmyk}{0.15,0.01,0.01,0.0}
\definecolor{bluelight}{cmyk}{0.15,0,0,0.0}
%\definecolor{pinklight}{cmyk}{0.08,0.45,0.0,0.0}
\definecolor{pinklight}{cmyk}{0.12,0.15,0.0,0.0}
\definecolor{greenlight}{cmyk}{0.10,0,0.30,0.0}
\definecolor{yellowlight}{cmyk}{0.0,0.20,1,0.0}
\definecolor{graylight}{cmyk}{0.0,0.0,0.0,0.12}


\newcommand*\highlightht{2.35ex}
\newcommand*\highlightdp{-.6ex}
\newcommand*\highlightwd{0.1ex}
\def\bluehighlight{\highlightcommon{bluelight}}
\def\greenhighlight{\highlightcommon{greenlight}}
\def\pinkhighlight{\highlightcommon{pinklight}}
\def\yellowhighlight{\highlightcommon{yellowlight}}
%\def\graytextcolor{\highlightcommon{graylight}}

\definecolor{highlightcolorone}{cmyk}{0.08,0.01,0.01,0}

\newcommand\highlightcommon[1]
  {%
    \bgroup
    \markoverwith
      {\textcolor{#1}{\smash{\rule[\highlightdp]{\highlightwd}{\highlightht}}}}%
    \ULon
  }

\definecolor{BrownTextColor}{cmyk}{0.04,0.08,0.13,0}

\def\graytextcolor#1{{\colorbox{10black}{#1}}}
\def\browntextcolor#1{{\colorbox{BrownTextColor}{#1}}}
\renewcommand{\qedsymbol}{\vbox{\hrule height0.6pt\hbox{\vrule height1.3ex width0.6pt\hskip0.8ex\vrule width0.6pt}\hrule height0.6pt}}
%\renewcommand{\qed}{\proofbox}



\usepackage{etoolbox} %% <- for \pretocmd, \apptocmd and \patchcmd

\usepackage[left,mathlines]{lineno}


%% Patch 'normal' math environments:
\newcommand*\linenomathpatch[1]{%
  \cspreto{#1}{\linenomath}%
  \cspreto{#1*}{\linenomath}%
  \csappto{end#1}{\endlinenomath}%
  \csappto{end#1*}{\endlinenomath}%
}
%% Patch AMS math environments:
\newcommand*\linenomathpatchAMS[1]{%
  \cspreto{#1}{\linenomathAMS}%
  \cspreto{#1*}{\linenomathAMS}%
  \csappto{end#1}{\endlinenomath}%
  \csappto{end#1*}{\endlinenomath}%
}

%% Definition of \linenomathAMS depends on whether the mathlines option is provided
\expandafter\ifx\linenomath\linenomathWithnumbers
  \let\linenomathAMS\linenomathWithnumbers
  %% The following line gets rid of an extra line numbers at the bottom:
  \patchcmd\linenomathAMS{\advance\postdisplaypenalty\linenopenalty}{}{}{}
\else
  \let\linenomathAMS\linenomathNonumbers
\fi

\linenomathpatch{equation}
\linenomathpatchAMS{gather}
\linenomathpatchAMS{multline}
\linenomathpatchAMS{align}
\linenomathpatchAMS{alignat}
\linenomathpatchAMS{flalign}

\AtBeginDocument{\DeclareSymbolFont{myoperators}   {OT1}{cmr} {m}{n}
\DeclareMathAccent{\bar}{\mathalpha}{myoperators}{"16}
\let\mathbb\relax
  \DeclareMathAlphabet{\mathbb}{U}{msb}{m}{n}}
\usepackage[all]{nowidow}
\usepackage{mathtools}

\newdimen\fracvskip
\newdimen\fraclastvskip

\fracvskip=8pt															

\def\fraclastvskip{}
\newdimen\subsupvskip															
\subsupvskip=4pt	

\AtBeginDocument{\def\doi#1#2{\href{#1}{#2}}}


\long\def\corresp#1{\gdef\@corresp{\footnotetext{\noindent\fontsize{8bp}{10bp}\selectfont#1}}}\gdef\@corresp{}%

\renewcommand{\appsection}[1]{\section*{#1}}
\renewcommand{\appsubsection}[1]{\subsection*{#1}}


\newenvironment{division}[1][]{\begingroup%
\setlist[itemize,1]{label={\textbullet},format={\color{BlueTextColor}\bfseries},labelsep=8bp,leftmargin=*,align=left,labelindent=0pt,
itemsep=0pt,itemindent=0pt,topsep=0bp,parsep=0pt,partopsep=0pt,rightmargin=0pt,listparindent=15pt,before={\raggedright},
%font={\fontsize{9bp}{12bp}\selectfont},before={\fontsize{9bp}{12bp}\selectfont}
}
\section*{#1}}{\endgroup}


\newenvironment{boxtype3}
               {\list{}{\leftmargin=11pt}%
                \item\relax\parindent=0pt}
               {\endlist\vspace*{13pt}}

\newif\if@boxtypefour\global\@boxtypefourfalse%

\newenvironment{authoraff}[1][]
               {\raggedright\global\@boxtypefourtrue\begingroup\section*{#1}\vspace*{-9pt}\par%
\def\authorfont{\bfseries\fontsize{8bp}{11bp}\selectfont}
\def\affiliationfont{\fontsize{8bp}{11bp}\selectfont}
               \parindent=0pt
\ifx\@author\empty\else\@author\par\fi
\ifx\@affiliation\empty\else{\affiliationfont\@affiliation\par\addvspace{-9pt}}\fi
\ifx\@secondauthor\empty\else\@secondauthor\par\fi
\ifx\@secondaffiliation\empty\else{\affiliationfont\@secondaffiliation\par\addvspace{-9pt}}\fi
\ifx\@thirdauthor\empty\else\@thirdauthor\par\fi
\ifx\@thirdaffiliation\empty\else{\affiliationfont\@thirdaffiliation\par\addvspace{-9pt}}\fi
\ifx\@fourthauthor\empty\else\@fourthauthor\par\fi
\ifx\@fourthaffiliation\empty\else{\affiliationfont\@fourthaffiliation\par\addvspace{-9pt}}\fi
\ifx\@fifthauthor\empty\else\@fifthauthor\par\fi
\ifx\@fifthaffiliation\empty\else{\affiliationfont\@fifthaffiliation\par\addvspace{-11pt}}\fi
\ifx\@sixthauthor\empty\else\@sixthauthor\par\fi
\ifx\@sixthaffiliation\empty\else{\affiliationfont\@sixthaffiliation\par\addvspace{-11pt}}\fi
\ifx\@sevenauthor\empty\else\@sevenauthor\par\fi
\ifx\@seventhaffiliation\empty\else{\affiliationfont\@seventhaffiliation\par\addvspace{-11pt}}\fi
\ifx\@eightauthor\empty\else\@eightauthor\par\fi
\ifx\@eightaffiliation\empty\else{\affiliationfont\@eightaffiliation\par\addvspace{-11pt}}\fi
\ifx\@ninthauthor\empty\else\@ninthauthor\par\fi
\ifx\@ninthaffiliation\empty\else{\affiliationfont\@ninthaffiliation\par\addvspace{-11pt}}\fi
\ifx\@tenthauthor\empty\else\@tenthauthor\par\fi
\ifx\@tenthaffiliation\empty\else{\affiliationfont\@tenthaffiliation\par\addvspace{-11pt}}\fi
\ifx\@eleventhauthor\empty\else\@eleventhauthor\par\fi
\ifx\@eleventhaffiliation\empty\else{\affiliationfont\@eleventhaffiliation\par\addvspace{-11pt}}\fi
\ifx\@twelthauthor\empty\else\@twelthauthor\par\fi
\ifx\@twelthaffiliation\empty\else{\affiliationfont\@twelthaffiliation\par\addvspace{-11pt}}\fi
\ifx\@thirteenthauthor\empty\else\@thirteenthauthor\par\fi
\ifx\@thirteenthaffiliation\empty\else{\affiliationfont\@thirteenthaffiliation\par\addvspace{-11pt}}\fi
\ifx\@fourteenthauthor\empty\else\@fourteenthauthor\par\fi
\ifx\@fourteenthaffiliation\empty\else{\affiliationfont\@fourteenthaffiliation\par\addvspace{-11pt}}\fi
\ifx\@fifteenthauthor\empty\else\@fifteenthauthor\par\fi
\ifx\@fifteenthaffiliation\empty\else{\affiliationfont\@fifteenthaffiliation\par\addvspace{-11pt}}\fi
\ifx\@sixteenthauthor\empty\else\@sixteenthauthor\par\fi
\ifx\@sixteenthaffiliation\empty\else{\affiliationfont\@sixteenthaffiliation\par\addvspace{-11pt}}\fi
\ifx\@seventeenthauthor\empty\else\@seventeenthauthor\par\fi
\ifx\@seventeenthaffiliation\empty\else{\affiliationfont\@seventeenthaffiliation\par\addvspace{-11pt}}\fi
\ifx\@eighteenthauthor\empty\else\@eighteenthauthor\par\fi
\ifx\@eightteenthaffiliation\empty\else{\affiliationfont\@eightteenthaffiliation\par\addvspace{-11pt}}\fi
\ifx\@nineteenthauthor\empty\else\@nineteenthauthor\par\fi
\ifx\@nineteenthaffiliation\empty\else{\affiliationfont\@nineteenthaffiliation\par\addvspace{-11pt}}\fi
\ifx\@twentythauthor\empty\else\@twentythauthor\par\fi
\ifx\@twentythaffiliation\empty\else{\affiliationfont\@twentythaffiliation\par\addvspace{-11pt}}\fi
}{\endgroup\global\@boxtypefourfalse}

\newcount\howtociteauthcnt%
\howtociteauthcnt=0%

\newcommand{\howtociteauthor}[2][1]{\advance\howtociteauthcnt by 1%
 \ifnum#1=1\gdef\@howtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=2\gdef\@secondhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=3\gdef\@thirdhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=4\gdef\@fourthhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=5\gdef\@fifthhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=6\gdef\@sixthhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=7\gdef\@sevenhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=8\gdef\@eighthowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=9\gdef\@ninthhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=10\gdef\@tenthhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=11\gdef\@eleventhhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=12\gdef\@twelthhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=13\gdef\@thirteenthhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=14\gdef\@fourteenthhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=15\gdef\@fifteenthhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=16\gdef\@sixteenthhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=17\gdef\@seventeenthhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=18\gdef\@eighteenthhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=19\gdef\@nineteenthhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=20\gdef\@twentythhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=21\gdef\@twentyonethhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=22\gdef\@twentytwohowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=23\gdef\@twentythridhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=24\gdef\@twentyfourthhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=25\gdef\@twentyfivethhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=26\gdef\@twentysixthhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=27\gdef\@twentyseventhhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=28\gdef\@twentyeightthhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=29\gdef\@twentyninethhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=30\gdef\@thirtythhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=31\gdef\@thirtyonehowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=32\gdef\@thirtytwohowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=33\gdef\@thirtythridhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=34\gdef\@thirtyfourthhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=35\gdef\@thirtyfivethhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=36\gdef\@thirtysixthhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=37\gdef\@thirtyseventhhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=38\gdef\@thirtyeightthhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=39\gdef\@thirtyninethhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=40\gdef\@fourtyhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=41\gdef\@fourtyonehowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=42\gdef\@fourtytwohowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=43\gdef\@fourtythridhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=44\gdef\@fourtyfourthhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=45\gdef\@fourtyfivethhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=46\gdef\@fourtysixthhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=47\gdef\@fourtyseventhhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=48\gdef\@fourtyeightthhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=49\gdef\@fourtyninethhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=50\gdef\@fiftytyhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=51\gdef\@fiftyonehowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=52\gdef\@fiftytwohowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=53\gdef\@fiftythridhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=54\gdef\@fiftyfourthhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=55\gdef\@fiftyfivethhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=56\gdef\@fiftysixthhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=57\gdef\@fiftyseventhhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=58\gdef\@fiftyeightthhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=59\gdef\@fiftyninethhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=60\gdef\@sixtyhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=61\gdef\@sixtyonehowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=62\gdef\@sixtytwohowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=63\gdef\@sixtythridhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=64\gdef\@sixtyfourthhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=65\gdef\@sixtyfivethhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=66\gdef\@sixtysixthhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=67\gdef\@sixtyseventhhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=68\gdef\@sixtyeightthhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=69\gdef\@sixtyninethhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=70\gdef\@seventyhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=71\gdef\@seventyonehowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=72\gdef\@seventytwohowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=73\gdef\@seventythridhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=74\gdef\@seventyfourthhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=75\gdef\@seventyfivethhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=76\gdef\@seventysixthhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=77\gdef\@seventyseventhhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=78\gdef\@seventyeightthhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=79\gdef\@seventyninethhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=80\gdef\@eigthtyhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=81\gdef\@eightyonehowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=82\gdef\@eightytwohowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=83\gdef\@eightythridhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=84\gdef\@eightyfourthhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=85\gdef\@eightyfivethhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=86\gdef\@eightysixthhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=87\gdef\@eightyseventhhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=88\gdef\@eightyeightthhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=89\gdef\@eightyninethhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=90\gdef\@ninetyhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=91\gdef\@ninetyonehowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=92\gdef\@ninetytwohowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=93\gdef\@ninetythridhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=94\gdef\@ninetyfourthhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=95\gdef\@ninetyfivethhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=96\gdef\@ninetysixthhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=97\gdef\@ninetyseventhhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=98\gdef\@ninetyeightthhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=99\gdef\@ninetyninethhowtociteauthor{{\howtociteauthorfont#2}}\else
 \ifnum#1=100\gdef\@hundaredhowtociteauthor
\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi%
}

\def\submitteddate{\@submitted}
\def\accepteddate{\@accepted}
\def\publisheddate{\@published}

\gdef\howtociteprintartdetails{%
\corresfont\par\ignorespaces\textbf{\color{BlueTextColor}TO CITE THIS ARTICLE:}\par\addvspace{-2pt}
\ifcase\howtociteauthcnt\relax
\or\@howtociteauthor\or
\@howtociteauthor\ {\&} \@secondhowtociteauthor\or
\@howtociteauthor{,} \@secondhowtociteauthor{,} {\&} \@thirdhowtociteauthor\or
\@howtociteauthor{,} \@secondhowtociteauthor{,} \@thirdhowtociteauthor{,} {\&} \@fourthhowtociteauthor\or
\@howtociteauthor{,} \@secondhowtociteauthor{,} \@thirdhowtociteauthor{,} \@fourthhowtociteauthor{,} {\&} \@fifthhowtociteauthor\or
\@howtociteauthor{,} \@secondhowtociteauthor{,} \@thirdhowtociteauthor{,} \@fourthhowtociteauthor{,} \@fifthhowtociteauthor{,} {\&} \@sixthhowtociteauthor\or
\@howtociteauthor{,} \@secondhowtociteauthor{,} \@thirdhowtociteauthor{,} \@fourthhowtociteauthor{,} \@fifthhowtociteauthor{,} \@sixthhowtociteauthor{,} {\&}  \@sevenhowtociteauthor\or
\@howtociteauthor{,} \@secondhowtociteauthor{,} \@thirdhowtociteauthor{,} \@fourthhowtociteauthor{,} \@fifthhowtociteauthor{,} \@sixthhowtociteauthor{,} \@sevenhowtociteauthor{,} {\&} \@eighthowtociteauthor\or
\@howtociteauthor{,} \@secondhowtociteauthor{,} \@thirdhowtociteauthor{,} \@fourthhowtociteauthor{,} \@fifthhowtociteauthor{,} \@sixthhowtociteauthor{,} \@sevenhowtociteauthor{,} \@eighthowtociteauthor{,} {\&} \@ninthhowtociteauthor\or
\@howtociteauthor{,} \@secondhowtociteauthor{,} \@thirdhowtociteauthor{,} \@fourthhowtociteauthor{,} \@fifthhowtociteauthor{,} \@sixthhowtociteauthor{,} \@sevenhowtociteauthor{,} \@eighthowtociteauthor{,} \@ninthhowtociteauthor{,} {\&} \@tenthhowtociteauthor\or
\@howtociteauthor{,} \@secondhowtociteauthor{,} \@thirdhowtociteauthor{,} \@fourthhowtociteauthor{,} \@fifthhowtociteauthor{,} \@sixthhowtociteauthor{,} \@sevenhowtociteauthor{,} \@eighthowtociteauthor{,} \@ninthhowtociteauthor{,} \@tenthhowtociteauthor{,} {\&} \@eleventhhowtociteauthor\or
\@howtociteauthor{,} \@secondhowtociteauthor{,} \@thirdhowtociteauthor{,} \@fourthhowtociteauthor{,} \@fifthhowtociteauthor{,} \@sixthhowtociteauthor{,} \@sevenhowtociteauthor{,} \@eighthowtociteauthor{,} \@ninthhowtociteauthor{,} \@tenthhowtociteauthor{,} \@eleventhhowtociteauthor{,}  {\&} \@twelthhowtociteauthor\or
\@howtociteauthor{,} \@secondhowtociteauthor{,} \@thirdhowtociteauthor{,} \@fourthhowtociteauthor{,} \@fifthhowtociteauthor{,} \@sixthhowtociteauthor{,} \@sevenhowtociteauthor{,} \@eighthowtociteauthor{,} \@ninthhowtociteauthor{,} \@tenthhowtociteauthor{,} \@eleventhhowtociteauthor{,} \@twelthhowtociteauthor{,} {\&} \@thirteenthhowtociteauthor\or
\@howtociteauthor{,} \@secondhowtociteauthor{,} \@thirdhowtociteauthor{,} \@fourthhowtociteauthor{,} \@fifthhowtociteauthor{,} \@sixthhowtociteauthor{,} \@sevenhowtociteauthor{,} \@eighthowtociteauthor{,} \@ninthhowtociteauthor{,} \@tenthhowtociteauthor{,} \@eleventhhowtociteauthor{,} \@twelthhowtociteauthor{,} \@thirteenthhowtociteauthor{,} {\&} \@fourteenthhowtociteauthor\or
\fi\ \@titlemark. \textit{Journal Title}. \@jyear; \@jvol(\@jissue): 00, \MSFirstPage--\MSLastPage. DOI: \textcolor{BlueTextColor}{https://\@doi}\vspace*{17pt}}

%\newenvironment{howtocite}[1][]{\begingroup\begin{figure*}[!b]%
%{\parindent=0pt\color{BlueTextColor}\rule{\textwidth}{2pt}}\par\addvspace{0pt}
%\fontsize{8bp}{11bp}\selectfont\textcolor{BlueTextColor}{\textbf{#1}}\par
%}{\end{figure*}\endgroup}

% \newbox\howtocitebox

% \newenvironment{howtocite}[1][]{\ifdim\pagetotal>.6\textheight\clearpage\phantom{aaaaa}\fi\vfill\null\hsize=\textwidth\linewidth=\textwidth\parindent=0pt
% \setbox\howtocitebox\vbox\bgroup}{\egroup\if@firstcolumn\else\hspace*{-\columnwidth}\hspace*{-\columnsep}\fi\parbox{\textwidth}{\parindent=0pt{\color{BlueTextColor}\rule{\textwidth}{2pt}}\par\addvspace{15pt}\box\howtocitebox}}

% \AfterEndEnvironment{thebibliography}{\begin{howtocite}
% \howtociteprintartdetails

% \textcolor{BlueTextColor}{\textbf{Submitted:}} \submitteddate\quad%
% \textcolor{BlueTextColor}{\textbf{Accepted:}} \accepteddate\quad
% \textcolor{BlueTextColor}{\textbf{Published:}} \publisheddate\par\addvspace{17.3pt}

% \begin{copyrighttext}[COPYRIGHT:]
% \copyright\ \the\year\ The Author(s). This is an open-access article distributed under the terms of the Creative Commons Attribution 4.0\newline
% International License (CC-BY 4.0), which permits unrestricted use, distribution, and reproduction in any medium, provided the original\newline
% author and source are credited. See \textcolor{BlueTextColor}{http://creativecommons.org/licenses/by/4.0/}.\vspace*{3.5pt}

% \textit{Journal Title%\@jname
% } is a peer-reviewed open access journal published by Ubiquity
% Press.\vspace*{24pt}

% \hspace*{-0pt}\includegraphics{./Styles/up_logo}\hspace*{9pt}\includegraphics{./Styles/Open_Access_logo_rgb}\vspace*{5pt}

% \end{copyrighttext}
% \end{howtocite}}

% -----------------------------
% Full-width How-to-cite environment
% -----------------------------
\newenvironment{howtocite}[1][]{
  % Optional page break if near bottom
  \ifdim\pagetotal>.6\textheight\clearpage\fi
  \vfill\null
  \parindent=0pt
  % % Capture content in a box
  \setbox0\vbox\bgroup
}{
  \egroup
  % Output full-width block
  \begin{center}
    {\color{BlueTextColor}\rule{\textwidth}{2pt}}\par\addvspace{15pt}
    \box0
  \end{center}
}

% -----------------------------
% Hook after bibliography
% -----------------------------
\AfterEndEnvironment{thebibliography}{
  % \clearpage % start fresh page
  \begin{howtocite}
    \onecolumn

    % Article details
    \howtociteprintartdetails

    % Dates
    \textcolor{BlueTextColor}{\textbf{Submitted:}} \submitteddate\quad
    \textcolor{BlueTextColor}{\textbf{Accepted:}} \accepteddate\quad
    \textcolor{BlueTextColor}{\textbf{Published:}} \publisheddate\par\addvspace{17.3pt}

    % Copyright text and logos
    \begin{copyrighttext}[COPYRIGHT:]
        \copyright\ \the\year\ The Author(s). This is an open-access article distributed under the terms of the Creative Commons Attribution 4.0\newline
        International License (CC-BY 4.0), which permits unrestricted use, distribution, and reproduction in any medium, provided the original\newline
        author and source are credited. See \textcolor{BlueTextColor}{http://creativecommons.org/licenses/by/4.0/}.\vspace*{3.5pt}
        
        \textit{\@jname} is a peer-reviewed open access journal published by Ubiquity Press.\vspace*{24pt}
        
        \hspace*{-0pt}\includegraphics{./Styles/up_logo}\hspace*{9pt}\includegraphics{./Styles/Open_Access_logo_rgb}\vspace*{5pt}
        
    \end{copyrighttext}
  \end{howtocite}
}


%\def\monospace#1{{\ttfamily\fontsize{8bp}{13bp}\selectfont\highlightcommon{highlightcolorone}{#1}}}
\def\monospace#1{{\ttfamily#1}}

\let\texttt\monospace

\def\textbgcolor#1{\highlightcommon{#1}}


\gdef\printRRAP{
\unvbox\RRAPbox%
\par\nointerlineskip\addvspace{10pt}\ignorespaces\nointerlineskip}%


\newbox\RRAPbox
\newenvironment{RRAP}[1][]{\global\setbox\RRAPbox\vbox\bgroup}{\egroup}

\usepackage{./Styles/aastex}
%\usepackage{ftnright}


\AtBeginDocument{
\renewcommand\footnoterule{%
 \if@firstcolumn
\hrule \@width\linewidth
\else
%\moveright-251pt
\vbox{\color{BlueTextColor}\hrule \@width\linewidth}%
\kern4.1\p@
\fi}

\renewcommand\@makefntext[1]{
\if@firstcolumn
\hspace*{-\columnwidth}\hspace*{-\columnsep}\parbox{\textwidth}{
\def\@makefnmark{\hbox{{\normalfont\textcolor{BlueTextColor}{\@thefnmark}}}}%
    \parindent 12\p@
    \noindent%\raggedright
    {\textsuperscript{\@makefnmark}\quad}\unskip#1\vphantom{py}}
\else
\parbox{\textwidth}{
\def\@makefnmark{\hbox{{\normalfont\@thefnmark}}}%
    \parindent 12\p@
    \noindent%\raggedright
    {\textsuperscript{\@makefnmark}}\unskip#1\vphantom{py}}
\fi }}


\AtBeginDocument{\if@hyperrefon
    \hypersetup{draft,
            linkcolor=black,
            bookmarks=false,%
            bookmarksopen=false,%
    }%
\else%
    \hypersetup{%
            colorlinks,
            breaklinks=true,
            plainpages=false,%
            citecolor=BlueTextColor,
            linkcolor=BlueTextColor,
            urlcolor=BlueTextColor,
            bookmarksopen=true,%
            bookmarksnumbered=false,%
            bookmarksdepth=5%
    }%
\fi}

\long\def\copyrighttextprint#1{\gdef\@copyrighttextprint{\fontsize{8bp}{11bp}\selectfont#1}}\gdef\@copyrighttextprint{}
%
\newenvironment{copyrighttext}[1][]{\bgroup\textcolor{BlueTextColor}{\textbf{#1}}\par\@copyrighttextprint}{\egroup}

\def\@artid{}
\def\@jname{}
\def\@jvol{00}
\def\@jid{}
\def\@jissue{00}
\gdef\@jyear{}
\def\@jmonth{xx} %% Summer, Winter, Fall,
\def\@jpublogo{}
\def\@journallogo{}
\def\@DOI{}
\def\nullvalue{xx}
\gdef\@doinumber{}

\gdef\jname#1{\gdef\@jname{#1}}
\def\artid#1{\gdef\@artid{#1}}
\def\jvol#1{\gdef\@jvol{#1}}
\def\jissue#1{\gdef\@jissue{#1}}
\def\jyear#1{\gdef\@jyear{#1}}
\def\jmonth#1{\gdef\@jmonth{#1}}
\def\jlogo#1{\gdef\@journallogo{#1}}%
\def\jid#1{\gdef\@jid{#1\relax}}
\def\@doi{\@jid/\@artid}
\def\doi#1{\gdef\@doi{\lowercase{#1}}}%

\def\email#1{\href{mailto:#1}{\textcolor{BlueTextColor}{#1}}}

%\AtBeginDocument{\renewcommand{\thefootnote}{\@fnsymbol\c@footnote}}

\let\columnbreak\pagebreak

\raggedbottom

\def\algtitlebg{\hbox to 0pt{\vbox to 0pt{\fboxsep0pt\fboxrule0pt%%
\hspace*{-11pt}%\raisebox{0pt}[0pt][0pt]
{\fcolorbox{highlightcolorone}{highlightcolorone}{\hbox to \columnwidth{\vbox to 21bp{}}}}}}}

\AtBeginEnvironment{tabular}{\tablebodyfont}


\usepackage{afterpage}

\newenvironment{algorithm}[1][]{\begingroup
\noindent\rule{\columnwidth}{0.75bp}\vspace*{-13pt}\par
\algtitlebg\hspace*{-6pt}#1\vspace*{-5pt}\par
\noindent\rule{\columnwidth}{0.75bp}\par
\list{}{\leftmargin12pt}
\item\relax}{\endlist\par\noindent\rule{\columnwidth}{0.75bp}\endgroup}

\def\@@@cmidrule[#1-#2]#3#4{\global\@cmidla#1\relax
    \global\advance\@cmidla\m@ne
    \ifnum\@cmidla>0\global\let\@gtempa\@cmidrulea\else
    \global\let\@gtempa\@cmidruleb\fi
    \global\@cmidlb#2\relax
    \global\advance\@cmidlb-\@cmidla
    \global\@thisrulewidth=#3
    \@setrulekerning{#4}
    \ifnum\@lastruleclass=\z@\vskip \aboverulesep\fi
    \ifnum0=`{\fi}\@gtempa
    \noalign{\ifnum0=`}\fi\futurenonspacelet\@tempa\@xcmidrule}

\DeclareMathSizes{8bp}{8bp}{6bp}{6bp}
\DeclareMathSizes{9bp}{9bp}{5.25bp}{5.25bp}
\DeclareMathSizes{7.5bp}{7.5bp}{4.37bp}{4.37bp}

\usepackage{lipsum}

\let\em\it
\usepackage{./Styles/DT-stix}
\usepackage[utf8]{inputenc}

\endinput
