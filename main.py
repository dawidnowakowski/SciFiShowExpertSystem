import tkinter as tk
import clips

def get_facts():
    return env.facts()

def append_answer(answer_string):
    fact_string = '(answer "' + answer_string + '")'
    env.assert_string(fact_string)

def run():
    env.run()

def setup():
    env.reset()

def run_expert_system():
    global answers, question
    run()
    facts = get_facts()
    answers = []
    for fact in facts:
        name = fact.template.name
        if name == "question":
            question = fact[0]
            for i in range(1, len(fact)):
                answers.append(fact[i])
            show_question()
            show_answers()

        elif name == "result":
            show_result(fact[0])

def next_button_callback():
    global answers

    append_answer(answers[selected_radio_button.get()])
    run_expert_system()

def close_button_callback():
    quit()

def radio_selected_callback():
    global next_button
    if next_button is not None:
        next_button.configure(state="normal")    

def clear_radio_grid():
    global radio_buttons
    for radio in radio_buttons:
        radio.grid_forget()
        radio.destroy()
    radio_buttons = []  
    

def show_result(result):
    global question
    next_button.configure(text="Exit", command=close_button_callback)
    clear_radio_grid()

    question = 'SCI FI movie for you is ' + result
    show_question()

def show_question():
    global question_label, question
    clear_radio_grid()

    if question_label is None:
        question_label = tk.Label(root, text=question, fg="#000")
        question_label.grid(row=0, column=0, columnspan=3, padx=20, pady=10)

    question_label.config(text=question)

def configure_next_button():
    global next_button

    if next_button is None:
        next_button = tk.Button(root, text="Next", command=next_button_callback)
        next_button.grid(row=3, column=1, padx=20, pady=20)

    next_button.config(command=next_button_callback)

def show_answers():
    global radio_buttons, answers_frame, answers

    temp = tk.Frame(root)

    for i, answer in enumerate(answers):
        radio = tk.Radiobutton(temp, text=answer, fg='#000', variable=selected_radio_button,  value=i, command=radio_selected_callback)
        radio.grid(row=i, column=0, padx=10, pady=5, sticky="w")
        radio_buttons.append(radio)

    answers_frame = temp
    answers_frame.grid(row=1, column=0, columnspan=3, padx=20, sticky="ew")

    
# TK
root = tk.Tk()
question_label = None
answers_frame = None
next_button = None
radio_buttons = []
selected_radio_button = tk.IntVar()

# globals
question = ""
answers = []


# CLIPS
env = clips.Environment()
env.load('tvseries.clp')

# GUI setup
root.title("What SF series should I watch on Netflix?")
root.minsize(500, 300)
root.grid_rowconfigure((0,2), weight=1)
root.grid_columnconfigure((0, 1, 2), weight=1)
configure_next_button()

# Load expert system data and run
setup()
run_expert_system()
root.mainloop()
