from ipdb import set_trace as st
# TODO optimize for large board sizes
gboard_len, num_obstacles = [5, 3]
rQueen, cQueen = [4, 3]

neg_row_no_col  = rQueen
neg_row_pos_col = gboard_len - rQueen
no_row_pos_col  = gboard_len - cQueen
pos_row_pos_col = gboard_len - rQueen
pos_row_no_col  = gboard_len - rQueen
pos_row_neg_col = gboard_len - rQueen
no_row_neg_col  = cQueen
neg_row_neg_col = cQueen

obstacle_coords = [[5, 5],[4, 2],[2, 3]]

for obstacle in obstacle_coords:

    print(obstacle)
    row_idx, col_idx = obstacle
    drow_abs = abs(rQueen - row_idx)
    dcol_abs = abs(cQueen - col_idx)

    drow = rQueen - row_idx
    dcol = cQueen - col_idx
    # st()
    if col_idx == cQueen:
        if row_idx > rQueen:
            pos_row_no_col = drow_abs if drow_abs < pos_row_no_col else pos_row_no_col
        else:
            pos_row_no_col = drow_abs if drow_abs < pos_row_no_col else pos_row_no_col
    elif row_idx == rQueen:
        if col_idx > cQueen:
            no_row_pos_col = dcol_abs if dcol_abs < no_row_pos_col else no_row_pos_col
        else:
            no_row_neg_col = dcol_abs if dcol_abs < no_row_pos_col else no_row_pos_col
    # Up left or down right
    elif drow / dcol == 1.0:
        #up
        if drow > 0:
            neg_row_neg_col = drow_abs if drow_abs < neg_row_neg_col else neg_row_neg_col
        #down
        else:
            pos_row_pos_col = drow_abs if drow_abs < pos_row_pos_col else pos_row_pos_col
    # up right or down left
    elif drow / dcol == -1.0:
        #up right
        if drow > 0:
            neg_row_pos_col = drow_abs if drow_abs < neg_row_pos_col else neg_row_pos_col
        else:
            pos_row_neg_col = drow_abs if drow_abs < pos_row_neg_col else pos_row_neg_col
    print(neg_row_no_col ,
    neg_row_pos_col,
    no_row_pos_col ,
    pos_row_pos_col,
    pos_row_no_col ,
    pos_row_neg_col,
    no_row_neg_col ,
    neg_row_neg_col)

print(neg_row_no_col  + neg_row_pos_col + no_row_pos_col  + pos_row_pos_col + pos_row_no_col  + pos_row_neg_col + no_row_neg_col + neg_row_neg_col - 8)


# def generate_board(size):
#     board = []
#     for i in range(0, size):
#         board.append(size * [None])
#
#     return board
#
#
# board = generate_board(board_len)
# board[rQueen - 1][cQueen - 1] = "Q"
# dirs = [[1,0],[1,1],[0,1],[-1,1],[-1,0],[-1,-1],[0,-1],[1,-1]]


# for row in board:
#     print(row)
# for a0 in range(num_obstacles):
#     row_idx, col_idx = input().strip().split(' ')
#     row_idx, col_idx = [int(row_idx),int(col_idx)]
#     board[row_idx - 1][col_idx - 1] = "x"






# num_can_attack = 0
# for dir in dirs:
#     print(dir)
#     try:
#         # print('dir: ', dir)
#         # Input for the queens position is also 1-indexed
#         current_q_pos = [rQueen - 1, cQueen - 1]
#         next_q_pos    =  [row_idx + col_idx for row_idx,  col_idx in zip(current_q_pos, dir)]
#         while board[next_q_pos[0]][next_q_pos[1]] != 'x' and next_q_pos[0] >= 0 and next_q_pos[1] >= 0:
#             print(next_q_pos)
#             num_can_attack += 1
#             next_q_pos      =  [row_idx + col_idx for row_idx, col_idx in zip(next_q_pos, dir)]
#     except IndexError:
#         # print('Index Error: ', dir)
#         continue
#
# print(num_can_attack)
