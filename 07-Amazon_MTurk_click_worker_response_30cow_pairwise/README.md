# MTurk Worker Response for Pairwise Lameness Assessment Using Click Interface

This folder contains code and data for launching, collecting, and processing MTurk worker responses via Amazon Mechanical Turk for pairwise lameness comparisons.

## Directory Structure

- **code/**: Python and R scripts for processing MTurk worker responses
  - `55HIT_10q_click_worker.py`: Main script for launching 55 HITs with 10 questions each (except HIT 0 has 12 questions)
  - `55HIT_10q_click_worker_helper.py`: Helper functions for the launch script
  - `55HIT_easy_hard_question_assess.R`: R script for analyzing easy vs. hard question performance
  - `55HIT_easy_hard_question_assess_helpers.R`: Helper functions for question assessment
  - `click_worker_pairwise_further_processing.py`: Script for additional processing of worker responses
  - `click_worker_pairwise_further_processing_helper.py`: Helper functions for further processing

- **plots/**: Visualization outputs
  - `test_HIT_performance.twb`: Tableau workbook for analyzing worker performance

- **results/**: Data files containing worker responses and analysis
  - `click_worker_HIT_submit_track.xlsx`: Master tracking file for all HIT submissions
  
  - **Tracker Files**:
    - `all_submitted_tracker_clicker_workers_*.csv`: Tracker for HIT submissions on different days
  
  - **Response Files Post Further Processing**:
    - `cowLR_response_clickWorker_55HITS.csv`: All worker responses recorded using each row recording ID of cow on the left VS ID of cow on the right
    - `cowLR_response_clickWorker_55HITS_pass_both.csv`: Responses from workers passing both attention checks
    - `cowLR_response_clickWorker_55HITS_pass_neg.csv`: Responses from workers passing negative attention checks
    - `cowLR_response_clickWorker_55HITS_pass_pos.csv`: Responses from workers passing positive attention checks
    - `cowLR_response_clickWorker_sampled_55HITS.csv`: Randomly sampled subset of worker responses to test the random sampling algorithm aimed at reducing the total number of pairwise comparisons needed to establish a reliable hierarchy
  
  - **Response Files**:
    - `master_all_responses_click_worker_*.csv`: Master file with all responses submitted at different dates, this dataframe recorded data post further processing
    - `master_approved_responses_click_worker_*.csv`: Approved worker responses
    - `master_rejected_responses_click_worker_*.csv`: Rejected worker responses (empty file as we did not reject any work)
    - `master_worker_response_tracker_click_worker_44HITsOct-01-2023.csv`: Raw data containing worker response tracker
  
  - **Winner-Loser Analysis Files**:
  - `winner_loser_55HITs.csv`: Complete winner-loser format analysis from all click worker responses across 55 HITs
  - `winner_loser_avg_55HITs.csv`: Winner-loser analysis using mean responses aggregated across all click workers
  - `winner_loser_sampled_55HITs.csv`: Analysis with equalized sampling (same number of workers per cow pair)
  - `winner_loser_sampled_delete_pairs_55HITs.csv`: Analysis where all cow pairs with average responses between (-1, 1) are removed
  - `winner_loser_sampled_exchange0_55HITs.csv`: Analysis where ambiguous pairs (avg response between -1 and 1) are replaced with balanced judgments (half A>B, half B>A)
  - `winner_loser_sampled_ind_exchange0_55HITs.csv`: Analysis where individual worker responses between [-1, 1] are set to 0
  - `winner_loser_milestone_min_55HITs.csv`: Analysis using 5 milestone cows with minimum comparison strategy (comparing with healthiest milestone cow first, stopping when difference exceeds 1 degree)
  - `winner_loser_milestone_max_55HITs.csv`: Analysis using 5 milestone cows with maximum comparison strategy (comparing with all 5 milestone cows)

## Data Files Description

### results/click_worker_HIT_submit_track.xlsx
Master tracking file containing submission information for all click-worker HITs:
- `date`: Date of submission
- `HIT`: HIT identifier
- `worker_num`: Number of workers
- `status`: Status of submission (completed & rejected, completed & approved, pending)
- `submit_file_name`: Name of the submission file
- `response_file_name`: Name of the response file
- `note`: Additional notes or comments

### Tracker Files (results/all_submitted_tracker_clicker_workers_*.csv)
- `HIT`: HIT number
- `HIT_id`: Unique identifier for the HIT
- `HIT_website_address`: URL to the HIT on MTurk
- `HIT_results_address`: URL to access the results on MTurk

### Response Files with ID of Left & Right Cow ID noted (results/cowLR_response_clickWorker_*.csv)
- `cow_L`: Left cow identifier
- `cow_R`: Right cow identifier
- `question_num`: Question number (q1, q2, etc.)
- `HIT`: HIT identifier
- `Worker_id`: MTurk worker identifier
- `response`: Worker's response value (typically 1-3, where higher value indicates stronger lameness difference between the 2 cows)

### Master Response Files (results/master_all_responses_click_worker_*.csv, master_approved_response_click_worker_*.csv, master_rejected_response_click_worker_*.csv)
- `HIT`: HIT number
- `HIT_id`: Unique identifier for the HIT
- `HIT_website_address`: URL to the HIT on MTurk
- `HIT_results_address`: URL to access results
- `HIT_status`: Status of the HIT (e.g., Reviewable)
- `submitted_assignments`: Number of submitted assignments from this worker
- `Worker_id`: MTurk worker identifier
- `Assignment_id`: Unique assignment identifier
- `Accept_time`: Time when the HIT was accepted
- `Submit_time`: Time when the HIT was submitted
- `Full_response`: JSON-formatted full response
- `isBot`: Flag indicating if the response is from a bot
- `assignment_status`: Status of the assignment (Approved, Submitted)
- `comment`: Worker comments if provided
- `q1` to `q10`: Responses to individual questions (-3 to 3 scale)
- `passed_negative_attention`: Flag indicating if negative attention check was passed (TRUE/FALSE)
- `passed_positive_attention_easy`: Flag indicating if positive attention check was passed (TRUE/FALSE)
- `score_all`: Score of accuracy for all questions (note this is not used in final analysis)
- `score_me2`: Score of accuracy only for questions with degress of lameness difference >= 2 as determined by experts (note this is not used in final analysis)
- `score_lt2`: Score of accuracy only for questions with degress of lameness difference < 2 as determined by experts (note this is not used in final analysis)
- `correct_questions`: List of correctly answered questions
- `incorrect_questions`: List of incorrectly answered questions

### Winner-Loser Files (winner_loser_*.csv)
Analysis files showing which cows were identified as more lame (winner) or less lame (loser) by workers:
- `winner`: Cow ID identified as more lame
- `loser`: Cow ID identified as less lame
- `degree`: Degree of lameness difference in comparison (i.e., how much more lame is winner against loser cow?)

## Notes

- The "winner_loser_milestone_*.csv" files contain data used for testing "5 milestone cow subsampling" algorithm used to test our ability to reduce the total number of comparisons
- The "winner_loser_sampled_*.csv" files contain data used for testing "randomly subsampling" algorithm used to test our ability to reduce the total number of comparisons