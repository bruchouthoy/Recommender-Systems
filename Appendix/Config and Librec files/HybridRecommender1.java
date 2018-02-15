package net.librec.recommender;

import net.librec.common.LibrecException;
import net.librec.recommender.SVDPlusPlusRecommender;
import net.librec.recommender.NaiveBayesRecommender;

public class HybridRecommender1 extends AbstractRecommender{

    NaiveBayesRecommender NB = new NaiveBayesRecommender();
    SVDPlusPlusRecommender SVD = new SVDPlusPlusRecommender();
    double nb_w;
    double svd_w;

    @Override
    public void setup() throws LibrecException {
        super.setup();
        context = getContext();

        // get weight parameters
        nb_w = conf.getDouble("rec.content.weight");
        svd_w = 1 - nb_w;

        // set up SVD++ and Naive Bayes model
        NB.setContext(context);
        NB.setup();

        SVD.setContext(context);
        SVD.setup();
    }

    @Override
    protected void trainModel() throws LibrecException {
        NB.trainModel();
        SVD.trainModel();
    }

    @Override
    protected double predict(int user, int item) throws LibrecException {
        // get weighted predictions
        double nb_prediction = NB.predict(user, item);
        double bmf_prediction = SVD.predict(user, item);
        return nb_prediction * nb_w + bmf_prediction * svd_w;
    }
}