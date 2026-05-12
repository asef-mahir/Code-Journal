#!/bin/bash

# Create topic-based directory structure
mkdir -p Algorithms/Matrix
mkdir -p Algorithms/Sliding_Window
mkdir -p Algorithms/Hashing
mkdir -p Algorithms/Bit_Manipulation
mkdir -p Algorithms/Math
mkdir -p Algorithms/Two_Pointers
mkdir -p Algorithms/Greedy
mkdir -p Algorithms/Prefix_Sum
mkdir -p Algorithms/Backtracking
mkdir -p Algorithms/Sorting
mkdir -p Algorithms/Binary_Search

# Matrix (2D array manipulation problems)
git mv Leetcode/Medium/48_rotate_image.cpp Algorithms/Matrix/LC_48_rotate_image.cpp
git mv Leetcode/Easy/1886_matrix_rotation_v1.cpp Algorithms/Matrix/LC_1886_matrix_rotation_v1.cpp
git mv Leetcode/Easy/1886_matrix_rotation_v2.cpp Algorithms/Matrix/LC_1886_matrix_rotation_v2.cpp

# Sliding_Window
git mv Leetcode/Medium/3_longest_substring_without_repeating_chars.cpp Algorithms/Sliding_Window/LC_3_longest_substring_without_repeating_chars.cpp
git mv Leetcode/Easy/219_contains_duplicate_II.cpp Algorithms/Sliding_Window/LC_219_contains_duplicate_II.cpp
git mv Leetcode/Medium/424_longest_repeating_char_replacement.cpp Algorithms/Sliding_Window/LC_424_longest_repeating_char_replacement.cpp

# Hashing
git mv Leetcode/Medium/49_group_anagrams.cpp Algorithms/Hashing/LC_49_group_anagrams.cpp
git mv Leetcode/Medium/3761_min_distance_mirror_pairs.cpp Algorithms/Hashing/LC_3761_min_distance_mirror_pairs.cpp
git mv "Codeforces/800-1000 Rating/1003A_Polycarp's_Pockets.cpp" Algorithms/Hashing/CF_1003A_Polycarps_Pockets.cpp

# Bit_Manipulation
git mv Leetcode/Easy/136_single_number.cpp Algorithms/Bit_Manipulation/LC_136_single_number.cpp
git mv Leetcode/Easy/191_number_of_1_bits_v1.cpp Algorithms/Bit_Manipulation/LC_191_number_of_1_bits_v1.cpp
git mv Leetcode/Easy/191_number_of_1_bits_v2.cpp Algorithms/Bit_Manipulation/LC_191_number_of_1_bits_v2.cpp
git mv Leetcode/Easy/231_power_of_two.cpp Algorithms/Bit_Manipulation/LC_231_power_of_two.cpp

# Math
git mv "Leetcode/Medium/50_pow(x,n).cpp" Algorithms/Math/LC_50_pow_x_n.cpp
git mv Leetcode/Easy/171_excel_sheet_column_no.cpp Algorithms/Math/LC_171_excel_sheet_column_no.cpp
git mv Leetcode/Medium/204_count_primes.cpp Algorithms/Math/LC_204_count_primes.cpp
git mv "Codeforces/800-1000 Rating/1269A_Equation.cpp" Algorithms/Math/CF_1269A_Equation.cpp
git mv "Codeforces/800-1000 Rating/1194A_Remove_a_Progression.cpp" Algorithms/Math/CF_1194A_Remove_a_Progression.cpp
git mv "Codeforces/800-1000 Rating/1323A_Even_Subset_Sum.cpp" Algorithms/Math/CF_1323A_Even_Subset_Sum.cpp

# Two_Pointers
git mv Leetcode/Easy/27_remove_element_v1.cpp Algorithms/Two_Pointers/LC_27_remove_element_v1.cpp
git mv Leetcode/Easy/27_remove_element_v2.cpp Algorithms/Two_Pointers/LC_27_remove_element_v2.cpp
git mv Leetcode/Easy/121_best_time_to_buy_and_sell_stock.cpp Algorithms/Two_Pointers/LC_121_best_time_to_buy_and_sell_stock.cpp
git mv Leetcode/Easy/125_valid_palindromes.cpp Algorithms/Two_Pointers/LC_125_valid_palindromes.cpp

# Greedy
git mv "Codeforces/800-1000 Rating/58A_Chat_Room.cpp" Algorithms/Greedy/CF_58A_Chat_Room.cpp

# Prefix_Sum
git mv Leetcode/Medium/3070_count_submatrices.cpp Algorithms/Prefix_Sum/LC_3070_count_submatrices.cpp
git mv Leetcode/Medium/238_productOfArray_except_self.cpp Algorithms/Prefix_Sum/LC_238_productOfArray_except_self.cpp

# Backtracking
git mv Leetcode/Medium/1415_happy_strings_v1_backtracking.cpp Algorithms/Backtracking/LC_1415_happy_strings_v1_backtracking.cpp

# Sorting
git mv Leetcode/Medium/347_top_k_frequent_elements_v1_sorting.cpp Algorithms/Sorting/LC_347_top_k_frequent_elements_v1_sorting.cpp

# Binary_Search
git mv Leetcode/Medium/74_search_a_2D_matrix.cpp Algorithms/Binary_Search/LC_74_search_a_2D_matrix.cpp

echo "Repository reorganization complete!"
echo "All files have been moved to Algorithms/[Topic]/ directories with LC_ or CF_ prefixes"
echo "Git history has been preserved using 'git mv' command"
