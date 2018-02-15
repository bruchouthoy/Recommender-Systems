package net.librec.recommender;

import net.librec.common.LibrecException;
import net.librec.recommender.SVDPlusPlusRecommender;
import net.librec.recommender.UserKNNRecommender;

public class HybridRecommender2 extends AbstractRecommender{

	UserKNNRecommender KNN = new UserKNNRecommender();
    SVDPlusPlusRecommender SVD = new SVDPlusPlusRecommender();
    double knn_w;
    double svd_w;

    @Override
    public void setup() throws LibrecException {
        super.setup();
        context = getContext();

        // get wegiht paramters
        knn_w = conf.getDouble("rec.content.weight");
        svd_w = 1 - knn_w;

        // set up SVD++ and Naive Bayes model
        KNN.setContext(context);
        KNN.setup();

        SVD.setContext(context);
        SVD.setup();
    }

    @Override
    protected void trainModel() throws LibrecException {
        KNN.trainModel();
        SVD.trainModel();
    }

    @Override
    protected double predict(int user, int item) throws LibrecException {
        // get weighted predictions
        double nb_prediction = KNN.predict(user, item);
        double bmf_prediction = SVD.predict(user, item);
        return nb_prediction * knn_w + bmf_prediction * svd_w;
    }
}