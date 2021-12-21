# AirBnB Listings: An in depth dive into the world of short-term sublets

## Team members
Armandas Bartas, Alex Romanus, Gabriel Lanzaro, Braeden Norman

## Description of the data 

Airbnb data for 280 000 listings including, but not limited to: host info, geographical data, price, number of bedrooms, amenities, and review scores. There are 33 total columns, 25 predictors when we filter out review scores and ID's.

## How to get data

Download folder from [here](https://drive.google.com/drive/folders/1s12BdUMhuM4MeUU5rPIP-T3ydkJ0SyAn?usp=sharing)
Replace the files in the data Folder with the download folder.

## Precise description of the question(s)

Wel will attempt to predict the user review score of AirBnB listings using the other variables in the provided dataset, including price, location, amenities, etc. 

## Why this question/dataset

This dataset is interesting to us because it combines our love for statistics with our love for vacation planning. Hopefully, intense statistical analysis of this data will provide insight while comparing prices and booking accomodations. 

## Reading list 

(papers you may need to read)
https://cran.r-project.org/web/packages/randomForest/randomForest.pdf
https://www.emerald.com/insight/content/doi/10.1108/JHTT-02-2019-0023/full/html
https://www.emerald.com/insight/content/doi/10.1108/IJCHM-12-2013-0542/full/html

## Team contract. 

For each area, write 1-2 sentences and including any rules to which your team collectively agrees (e.g. "We agree to make 1 commit per week." or "We agree to meet in the library every other Friday.")

**Participation**  
We agree to divide the work fairly and equally, and to each complete our own portions within agreed upon timeframes. 

**Communication**  
We agree to check our slack group chat at least once per two days.

**Meetings**  
We agree to meet twice per project checkpoint. Once to divide our task, and again to combine our work.

**Conduct**  
We agree to help each other when stuck and to treat each other with respect and dignity. 

***
Do not make any changes from here on. Only the TAs will edit the following.


# Checkpoint 1 grade

(5 / 5)



# Checkpoint 2 grade

__Total__ (29 / 30)

__Words__ (6 / 6) The text is laid out cleanly, with clear divisions
and transitions between sections and sub-sections. The writing itself
is well-organized, free of grammatical and other mechanical errors,
divided into complete sentences logically grouped into paragraphs and
sections, and easy to follow from the presumed level of knowledge. 

__Numbers__ (1 / 1) All numerical results or summaries are reported to
suitable precision, and with appropriate measures of uncertainty
attached when applicable. 

__Pictures__ (6 / 7) Figures and tables are easy to read, with
informative captions, axis labels and legends, and are ~placed near the
relevant pieces of text~ or referred to with convenient labels.

__Code__ (4 / 4) The code is formatted and organized so that it is easy
for others to read and understand. It is indented, ~commented~, and uses
meaningful names. It only includes computations which are actually
needed to answer the analytical questions, and avoids redundancy. Code
borrowed from the notes, from books, or from resources found online is
explicitly acknowledged and sourced in the comments. Functions or
procedures not directly taken from the notes have accompanying tests
which check whether the code does what it is supposed to. The text of
the report is free of intrusive blocks of code. With regards to R Markdown,
all calculations are actually done in the file as it knits, and only
relevant results are shown.

__Exploratory data analysis__ (12 / 12) Variables are examined individually and
bivariately. Features/observations are discussed with appropriate
figure or tables. The relevance of the EDA to the questions and
potential models is clearly explained.

__Comment__
1. https://learning.github.ubc.ca/STAT-406-101-2021W/project-spaghetti-code-and-meatballs/blob/b78f61e55802de189d2dd6710304f6fc93cd546d/report.Rmd#L159 It would be interesting to see a confusion matrix with sensitivity and specificty listed out to get a better understand what type of misclassification it is. 
2. https://learning.github.ubc.ca/STAT-406-101-2021W/project-spaghetti-code-and-meatballs/blob/b78f61e55802de189d2dd6710304f6fc93cd546d/report.Rmd#L171 The text explaining these plots should be closer to the plot itself. It is a rather difficult scatterplot to understand so it'll need some more comments. 
3. Overall, very well done! Consider adding more comments to your code in the future since it's not very straighforward and when you revisit your own code one day, you might forget why you did the certain step.



# Checkpoint 3 grade

__Total__ (56 / 65)

__Words__ (8 / 8) The text is laid out cleanly, with clear divisions and
transitions between sections and sub-sections.  The writing itself is
well-organized, free of grammatical and other mechanical errors, divided into
complete sentences logically grouped into paragraphs and sections, and easy to
follow from the presumed level of knowledge.

__Numbers__ (1 / 1) All numerical results or summaries are reported to
suitable precision, and with appropriate measures of uncertainty attached when
applicable.

__Pictures__ (4 / 7) Figures and tables are easy to read, with ~informative
captions, axis labels and legends~, and are placed near the relevant pieces of
text.

__Code__ (2 / 4) The code is ~formatted~ and organized so that it is easy
for others to read and understand.  It is indented, ~commented,~ and uses
meaningful names.  It only includes computations which are actually needed to
answer the analytical questions, and ~avoids redundancy.~  Code borrowed from the
notes, from books, or from resources found online is explicitly acknowledged
and sourced in the comments.  Functions or procedures not directly taken from
the notes have accompanying tests which check whether the code does what it is
supposed to. The text of the report is free of intrusive blocks of code.  If
you use R Markdown, all calculations are actually done in the file as it knits,
and only relevant results are shown. 

__Exploratory Data Analysis__ (12 / 12) Variables are examined individually and
bivariately. Features/observations are discussed with appropriate
figure or tables. The relevance of the EDA to the questions and
potential models is clearly explained.

__Results and analysis__ (21 / 25) The statistical summaries
are clearly related to, or possibly derive from, the substantive questions of interest.  Any
assumptions are checked by means of appropriate diagnostic plots or
formal tests. Limitations from un-fixable problems are
clearly noted. The actual estimation
of parameters, predictions, or other calculations are technically correct.  All calculations
based on estimates are clearly explained, and also technically correct.  All
estimates or derived quantities are accompanied with appropriate measures of
uncertainty. 

__Conclusions__ (8 / 8) The substantive questions are answered as
precisely as the data and the model allow.  The chain of reasoning from
estimation results about models, or derived quantities, to substantive
conclusions is both clear and convincing.  Contingent answers ("if $X$, then
$Y$, but if $Z$, then $W$") are likewise described as warranted by the
and data.  If uncertainties in the data mean the answers to some
questions must be imprecise, this too is reflected in the conclusions.

__Comment__
Further justification of the 7 classification methods would be great i.e what makes lasso logistic with lambda selected via CV better than the default? Why QDA over LDA? Stating your throught process will help guide the readers. 

Remove commented out code if not useful; also consider adding more comments in code for clarity. 

Tables will benefit from a table title. Lasso L1 Norm plots are missing the names for each city.
