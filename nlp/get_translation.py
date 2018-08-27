import pandas as pd

import argparse

from googletrans import Translator
from nltk.sentiment.vader import SentimentIntensityAnalyzer


def main(opt):
    pass


def comment_eval(x, target_lang='en'):
    '''
    :param x: Pandas dataframe
    :param target_lang: Target language to translate to
    :return: Translated comments
    :todo: Add target_lang to arg parser and remove hard-coding for comment field
    '''
    translator = Translator()
    sentimenter = SentimentIntensityAnalyzer()

    detect_lang = translator.detect(x['comment_text'])
    sentiment = sentimenter.polarity_scores(x['comment_text'])

    lang = detect_lang.lang
    confidence = detect_lang.confidence
    translation = translator.translate(x['comment_text'], dest=target_lang).text
    compound = sentiment['compound']
    neutral_score = sentiment['neu']
    negative_score = sentiment['neg']
    positive_score = sentiment['pos']

    return lang, confidence, translation, compound, neutral_score, negative_score, positive_score

if "__name__" = "__main__":
    parser = argparse.ArgumentParser(description = 'Process comments')
    parser._action_groups.pop()
    required = parser.add_argument_group('required arguments')
    optional = parser.add_argument_group('optional arguments')
    required.add_argument('-f', '--file', help='Input file path', required=True)
    optional.add_argument('-o', '--output', help='Output file path', default='stdout')

    opt = parser.parse_args()
    main(opt)