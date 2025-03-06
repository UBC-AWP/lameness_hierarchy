# Generating HTML for 54 Human Intelligence Tasks to Be Completed by MTurk Workers

This folder contains code and data for generating HTML-based interfaces for 54 Human Intelligence Tasks (HITs) designed for Amazon Mechanical Turk workers to perform pairwise cow lameness assessments.

## Directory Structure

- **code/**: Python scripts for generating the HTML interfaces
  - `Create_HTML_click_worker.py`: Main script that generates the HTML interfaces
  - `Create_HTML_click_worker_helper.py`: Helper functions for the main script
  - **input_file/**: HTML/CSS/JavaScript components stored as text files
    - `p1_css.txt`: CSS styling for the labeling interface
    - `p2_html_q1.txt`: HTML template for the first question
    - `p2_html_other_q.txt`: HTML template for additional questions
    - `p3_js.txt`: JavaScript functionality for the interface

- **results/**: Generated files for HITs
  - `all_HIT_answer.csv`: Combined answers from all HITs
  - `unique_pair_id.csv`: Mapping of unique pair identifiers for cow comparisons
  - **Individual HIT files** (HIT0-HIT54):
    - `HIT*.html`: HTML interface files for each HIT (0-54)
    - `HIT*_answer.csv`: Response data files for each HIT (0-54)

## Data Files Description

### unique_pair_id.csv

- `cow_L`: Left cow identifier
- `cow_R`: Right cow identifier
- `cow_L_URL`: URL to video of left cow
- `cow_R_URL`: URL to video of right cow
- `pair_id`: Unique identifier for each cow pair
- `question_type`: Type of question (potentially includes attention checks)
- `expert_answer`: Expert's assessment (reference from expert response)

### all_HIT_answer.csv

- `cow_L`: Left cow identifier
- `cow_R`: Right cow identifier
- `cow_L_URL`: URL to video of left cow
- `cow_R_URL`: URL to video of right cow
- `pair_id`: Unique identifier for each cow pair
- `question_type`: Type of question (e.g., pos_attention_easy, neg_attention)
- `expert_answer`: Expert's assessment value (-3 to 3 scale)
- `question_num`: Question identifier (q1, q2, etc.)
- `HIT`: HIT identifier
- `question_id`: Question identifier in format HIT-question (e.g., 0-q1)

### Individual HIT Answer Files (HIT0_answer.csv to HIT54_answer.csv)

All files with pattern `HIT*_answer.csv` contain:

- `cow_L`: Left cow identifier
- `cow_R`: Right cow identifier
- `cow_L_URL`: URL to video of left cow
- `cow_R_URL`: URL to video of right cow
- `pair_id`: Unique identifier for each cow pair
- `question_type`: Type of question (e.g., pos_attention_easy, neg_attention)
- `expert_answer`: Expert's assessment value (-3 to 3 scale)
- `question_num`: Question identifier (q1, q2, etc.)
- `HIT`: HIT identifier
- `question_id`: Question identifier in format HIT-question

### HTML Files (HIT0.html to HIT54.html)

These are generated HTML interface files that include:

- Side-by-side video comparison of two cows
- Click-based interface for workers to do pairwise lameness assessment
- Clear instructions for workers
- Attention check questions to ensure quality responses
- Embedded CSS styling and JavaScript functionality
